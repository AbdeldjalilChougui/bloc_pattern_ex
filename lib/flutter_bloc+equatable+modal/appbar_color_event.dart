import 'appbar_color_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppBarEvent extends Equatable {
  AppBarEvent([List props = const []]) : super();
}

class GetColor extends AppBarEvent {
  final AppbarColorModal color;

  GetColor(this.color) : super([color]);

  @override
  // TODO: implement props
  List<Object> get props => [color];
}