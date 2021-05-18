import 'package:flutter/material.dart';

import 'data_event.dart';
import 'data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  // TODO: implement initialState
  DataState get initialState => InitialData();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async*{
    if (event is GetData)
      yield LoadingData();
      final data = await _getData(event);
      yield LoadedData(data);
  }

  _getData(GetData event) {
    return Future.delayed(Duration(seconds: 1), () {
      return event.data;
    });
  }
}