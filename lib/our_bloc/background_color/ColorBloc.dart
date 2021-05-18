import 'dart:async';
import 'colorevent.dart';
import 'package:flutter/material.dart';

class ColorBloc {

  Color color = Colors.white;

  final colorStateController = StreamController<Color>();

  Sink<Color> get inColorState => colorStateController.sink;

  Stream<Color> get outColorState => colorStateController.stream;

  final colorEventController = StreamController<ColorEvent>();

  Sink<ColorEvent> get colorEvent => colorEventController.sink;

  ColorBloc() {
    colorEventController.stream.listen((event) {
      if (event is WhiteEvent)
        color = Colors.white;
      if (event is BlackEvent)
        color = Colors.grey[600];
      if (event is PinkEvent)
        color = Colors.pink;
      if (event is GreenEvent)
        color = Colors.green;

      inColorState.add(color);
    });
  }
}