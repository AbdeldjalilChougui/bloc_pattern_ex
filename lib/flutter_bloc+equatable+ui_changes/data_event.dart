import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DataEvent extends Equatable {
  DataEvent([List props = const[]]) : super();
}

class GetData extends DataEvent {
  final IconData data;
  GetData({this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}