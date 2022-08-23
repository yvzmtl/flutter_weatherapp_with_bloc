import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/thema/bloc/thema_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/bloc/bloc.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/widget/weather_app.dart';

import 'blocs/thema/bloc/bloc.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider(
      builder: (context) => ThemaBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemaBloc>(context),
      builder: (context, ThemaState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state as UygulamaTemasi).theme,
          home: BlocProvider<WeatherBloc>(
              builder: (context) => WeatherBloc(), child: WeatherApp()),
        );
      },
    );
  }
}
