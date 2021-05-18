import 'second_color_event.dart';
import 'second_color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondColorBloc extends Bloc<SecondColorEvent, SecondColorState> {

  void onBlueEvent() {
    add(SecondBlueEvent());
  }

  void onGreenEvent() {
    add(SecondGreenEvent());
  }
  void onWhiteEvent() {
    add(SecondWhiteEvent());
  }
  void onBlackEvent() {
    add(SecondBlackEvent());
  }

  @override
  SecondColorState get initialState => SecondColorState.initial();

  @override
  Stream<SecondColorState> mapEventToState(SecondColorEvent event) async*{
    if (event is SecondBlueEvent)
      yield SecondColorState(Colors.blue);
    if (event is SecondGreenEvent)
      yield SecondColorState(Colors.green);
    if (event is SecondWhiteEvent)
      yield SecondColorState(Colors.white);
    if (event is SecondBlackEvent)
      yield SecondColorState(Colors.grey[600]);
  }
}