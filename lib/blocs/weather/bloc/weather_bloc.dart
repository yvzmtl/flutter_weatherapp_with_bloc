import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        //hava durumu getirme kodları
        // WeatherRepository weatherRepository = WeatherRepository();
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        //hava durumu getirme kodları
        // WeatherRepository weatherRepository = WeatherRepository();
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield state;
      }
    }
  }
}
