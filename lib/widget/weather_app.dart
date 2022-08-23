import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/thema/bloc/bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/bloc/bloc.dart';
import 'package:flutter_weatherapp_with_bloc/widget/gecisli_arkaplan_renk.dart';
import 'package:flutter_weatherapp_with_bloc/widget/hava_durumu_resim.dart';
import 'package:flutter_weatherapp_with_bloc/widget/location.dart';
import 'package:flutter_weatherapp_with_bloc/widget/max_min_sicaklik.dart';
import 'package:flutter_weatherapp_with_bloc/widget/sehir_sec.dart';
import 'package:flutter_weatherapp_with_bloc/widget/son_guncelleme_widget.dart';

class WeatherApp extends StatelessWidget {
  String selectedCity = "Ankara";
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final WeatherBloc _weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              selectedCity = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SehirSecWidget()));
              debugPrint("seçilen şehir : " + selectedCity);
              if (selectedCity != null) {
                _weatherbloc.add(FetchWeatherEvent(cityName: selectedCity));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherbloc,
          builder: (context, WeatherState state) {
            if (state is InitialWeatherState) {
              return Center(
                child: Text("Şehir Seçiniz"),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              final getirilenweather = state.weather;

              final _havaDurumuKisaltma =
                  getirilenweather.consolidatedWeather[0].weatherStateAbbr;
              selectedCity = getirilenweather.title;
              BlocProvider.of<ThemaBloc>(context).add(
                  TemaDegistirEvent(havaDurumuKisaltmasi: _havaDurumuKisaltma));

              _refreshCompleter.complete();
              _refreshCompleter = Completer();
              return BlocBuilder(
                bloc: BlocProvider.of<ThemaBloc>(context),
                builder: (context, ThemaState state) => GecisliRenkContainer(
                  color: (state as UygulamaTemasi).color,
                  child: RefreshIndicator(
                    onRefresh: () {
                      _weatherbloc
                          .add(RefreshWeatherEvent(cityName: selectedCity));
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: LocationWidget(
                            selectedCity: getirilenweather.title,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: SonGuncellemeWidget()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: HavaDurumuResim()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: MaxMinSicaklik()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            if (state is WeatherErrorState) {
              return Center(
                child: Text("Hata Oluştu"),
              );
            }
          },
        ),
      ),
    );
  }
}
