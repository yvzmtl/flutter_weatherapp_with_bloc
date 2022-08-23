import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemaState extends Equatable {
  const ThemaState();
}

class InitialThemaState extends ThemaState {
  @override
  List<Object> get props => [];
}

class UygulamaTemasi extends ThemaState {
  final ThemeData theme;
  final MaterialColor color;

  UygulamaTemasi({@required this.theme, @required this.color});

  @override
  List<Object> get props => [theme, color];
}
