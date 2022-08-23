import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/bloc/bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  _weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherbloc,
      builder: (context, state) {
        var newtime = (state as WeatherLoadedState).weather.time.toLocal();
        return Text(
          "Son Güncelleme  " + TimeOfDay.fromDateTime(newtime).format(context),
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}
