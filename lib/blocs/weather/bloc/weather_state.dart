import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import 'package:meta/meta.dart';

abstract class WeatherState extends Equatable {
  const WeatherState([List props =const[]]);
}

class InitialWeatherState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => null;
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  @override
  List<Object> get props => null;
}
