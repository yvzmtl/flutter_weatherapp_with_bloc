import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/bloc/bloc.dart';

class MaxMinSicaklik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc _weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherbloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Max Sıcaklık " +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .maxTemp
                      .floor()
                      .toString() +
                  " °C",
              style: TextStyle(fontSize: 16),
            ),
            Text(
                "Min Sıcaklık " +
                    (state as WeatherLoadedState)
                        .weather
                        .consolidatedWeather[0]
                        .minTemp
                        .floor()
                        .toString() +
                    " °C",
                style: TextStyle(fontSize: 16)),
          ],
        );
      },
    );
  }
}
