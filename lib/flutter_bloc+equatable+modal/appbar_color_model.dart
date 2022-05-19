import 'package:flutter/material.dart';

enum AppbarColorModal {
  Blue,
  Black,
  White,
  Green,
}

final AppbarColorData = {
  AppbarColorModal.Blue : ThemeData (
    brightness: Brightness.light,
    primaryColor: Colors.blue
  ),
  AppbarColorModal.Green : ThemeData (
      brightness: Brightness.light,
      primaryColor: Colors.green
  ),
  AppbarColorModal.Black : ThemeData (
      brightness: Brightness.light,
      primaryColor: Colors.black
  ),
  AppbarColorModal.White : ThemeData (
      brightness: Brightness.light,
      primaryColor: Colors.white
  ),
};