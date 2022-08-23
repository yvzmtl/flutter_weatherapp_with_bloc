import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class ThemaEvent extends Equatable {
  const ThemaEvent();
}

class TemaDegistirEvent extends ThemaEvent {
  final String havaDurumuKisaltmasi;
  TemaDegistirEvent({@required this.havaDurumuKisaltmasi});

  @override
  List<Object> get props => [havaDurumuKisaltmasi];
}
