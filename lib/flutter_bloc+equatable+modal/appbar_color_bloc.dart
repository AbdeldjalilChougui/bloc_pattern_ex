import 'appbar_color_event.dart';
import 'appbar_color_model.dart';
import 'appbar_color_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarColorState> {
  @override
  // TODO: implement initialState
  get initialState => AppBarColorState(color: AppbarColorData[AppbarColorModal.Blue]);

  @override
  Stream<AppBarColorState> mapEventToState( event) async*{
    if (event is GetColor)
      yield AppBarColorState(color: AppbarColorData[event.color]);
  }
}