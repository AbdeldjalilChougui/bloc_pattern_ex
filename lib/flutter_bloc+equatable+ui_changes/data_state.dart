import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DataState extends Equatable {
  DataState([List props = const[]]) : super();
}

class InitialData extends DataState {
  final IconData data = Icons.close;

  @override
  List<Object> get props => [Icons.close];
}

class LoadingData extends DataState {
  @override
  List<Object> get props => [];
}

class LoadedData extends DataState {
  final IconData data;

  LoadedData(this.data) : super([data]);
  @override
  List<Object> get props => [data];
}
