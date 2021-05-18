import 'package:flutter/material.dart';

class SecondColorState {

  Color color;

  SecondColorState(this.color);

  SecondColorState._();

  factory SecondColorState.initial() {
    return SecondColorState._()..color = Colors.blue;
  }
}