import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class ThemaBloc extends Bloc<ThemaEvent, ThemaState> {
  @override
  ThemaState get initialState =>UygulamaTemasi(theme: ThemeData.light(),color:Colors.blue );

  @override
  Stream<ThemaState> mapEventToState(
    ThemaEvent event,
  ) async* {
    UygulamaTemasi uygulamaTemasi;

    if (event is TemaDegistirEvent) {
      switch(event.havaDurumuKisaltmasi){
        case "sn"://karlı
        case "sl"://sulu kar
        case "h": //dolu
        case "t": //fırtına
        case "hc"://çok bulutlu
          uygulamaTemasi = UygulamaTemasi(theme: ThemeData(primaryColor: Colors.blueGrey),color: Colors.grey);
          break;
        case "hr"://ağır yağmurlu
        case "lr"://hafif yağmurlu
        case "s"://sağanak yağış
          uygulamaTemasi = UygulamaTemasi(theme: ThemeData(primaryColor: Colors.indigoAccent),color: Colors.indigo);
          break;
        case "lc"://az bulutlu
        case "c"://açık güneşli hava
          uygulamaTemasi = UygulamaTemasi(theme: ThemeData(primaryColor: Colors.orangeAccent),color: Colors.yellow);
          break;
      }
      yield uygulamaTemasi;
    }
  }
}
