import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/bloc/bloc.dart';

class HavaDurumuResim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherbloc,
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Text(
              (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .theTemp
                      .floor()
                      .toString() +
                  "°C",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image.network(
              "https://www.metaweather.com/static/img/weather/png/" +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .weatherStateAbbr +
                  ".png",
              width: 150.0,
              height: 150.0,
            ),
          ],
        );
      },
    );
  }
}
