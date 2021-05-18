import 'dart:async';
import 'counter_event.dart';

class CounterBloc {

  int counter = 0;

  final counterStateController = StreamController<int> ();

  Sink<int> get inController => counterStateController.sink;

  Stream<int> get outController => counterStateController.stream;


  final counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => counterEventController.sink;

  CounterBloc () {
    counterEventController.stream.listen(mapEventToState);
  }

  void mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      counter++;
    else
      counter--;

    inController.add(counter);
  }

  void dispose() {
    counterStateController.close();
    counterEventController.close();
  }
}