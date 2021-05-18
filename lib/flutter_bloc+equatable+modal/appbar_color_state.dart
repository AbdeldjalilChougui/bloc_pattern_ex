import 'package:equatable/equatable.dart';
import 'appbar_color_model.dart';
import 'package:flutter/material.dart';

@immutable
class AppBarColorState extends Equatable {
  ThemeData color;

  AppBarColorState({this.color}) : super();

  @override
  // TODO: implement props
  List<Object> get props => [color];
}