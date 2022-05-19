import 'dart:math';

import 'package:blocpatternex/flutter_bloc+equatable+ui_changes/data_bloc.dart';
import 'package:blocpatternex/flutter_bloc+equatable+ui_changes/data_event.dart';
import 'package:blocpatternex/flutter_bloc+equatable+ui_changes/data_state.dart';
import 'package:blocpatternex/flutter_bloc_blocprovider/second_color_bloc.dart';

import 'our_bloc/background_color/ColorBloc.dart';
import 'package:blocpatternex/flutter_bloc+equatable+modal/appbar_color_bloc.dart';
import 'package:blocpatternex/flutter_bloc+equatable+modal/appbar_color_event.dart';
import 'package:blocpatternex/flutter_bloc+equatable+modal/appbar_color_model.dart';
import 'package:blocpatternex/flutter_bloc+equatable+modal/appbar_color_state.dart';
import 'our_bloc/background_color/colorevent.dart';
import 'our_bloc/counter/counter_bloc.dart';
import 'our_bloc/counter/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final secondColorBloc = SecondColorBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => secondColorBloc,
      child: Testing(),
    );
  }
}


class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final bloc = CounterBloc();
  final colorBloc = ColorBloc();
  final appBarColorBloc = AppBarBloc();
  final dataBloc = DataBloc();

  List<IconData> icons = [
    Icons.verified_outlined,
    Icons.accessibility_rounded,
    Icons.add_a_photo,
    Icons.add_business_outlined,
    Icons.wine_bar_sharp,
    Icons.wifi_calling,
    Icons.backup_table_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBloc.color,
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.outController,
              initialData: 0,
              builder: (context,snapshot) {
                return BlocBuilder(
                    bloc: BlocProvider.of<SecondColorBloc>(context),
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'You have pushed the button this many times:',
                            style: TextStyle(
                              color: state.color,
                            ),
                          ),
                          Text(
                            '${snapshot.data}',
                            style: TextStyle(
                              color: state.color,
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
            ),
            SizedBox(height: 30,),
            Text("Background Color",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            StreamBuilder(
              initialData: Colors.white,
              stream: colorBloc.outColorState,
              builder: (context, snapshot) {
                return Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        colorBloc.colorEvent.add(WhiteEvent());
                        setState(() {});
                      },
                      shape: CircleBorder(),
                      color: Colors.white,
                      elevation: 18,
                    ),
                    MaterialButton(
                      onPressed: () {
                        colorBloc.colorEvent.add(BlackEvent());
                        setState(() {});
                      },
                      shape: CircleBorder(),
                      color: Colors.grey[600],
                      elevation: 18,
                    ),
                    MaterialButton(
                      onPressed: () {
                        colorBloc.colorEvent.add(PinkEvent());
                        setState(() {});
                      },
                      shape: CircleBorder(),
                      color: Colors.pink,
                      elevation: 18,
                    ),
                    MaterialButton(
                      onPressed: () {
                        colorBloc.colorEvent.add(GreenEvent());
                        setState(() {});
                      },
                      shape: CircleBorder(),
                      color: Colors.green,
                      elevation: 18,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20,),
            Text("Text Color",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    BlocProvider.of<SecondColorBloc>(context).onBlueEvent();
                  },
                  shape: CircleBorder(),
                  color: Colors.blue,
                  elevation: 18,
                ),
                MaterialButton(
                  onPressed: () {
                    BlocProvider.of<SecondColorBloc>(context).onGreenEvent();
                  },
                  shape: CircleBorder(),
                  color: Colors.green,
                  elevation: 18,
                ),
                MaterialButton(
                  onPressed: () {
                    BlocProvider.of<SecondColorBloc>(context).onWhiteEvent();
                  },
                  shape: CircleBorder(),
                  color: Colors.white,
                  elevation: 18,
                ),
                MaterialButton(
                  onPressed: () {
                    BlocProvider.of<SecondColorBloc>(context).onBlackEvent();
                  },
                  shape: CircleBorder(),
                  color: Colors.grey[600],
                  elevation: 18,
                ),
              ],
            ),
            BlocBuilder(
              bloc: appBarColorBloc,
              builder: (context, AppBarColorState state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            appBarColorBloc.add(GetColor(AppbarColorModal.Blue));
                          },
                          shape: CircleBorder(),
                          color: Colors.blue,
                          elevation: 18,
                        ),
                        MaterialButton(
                          onPressed: () {
                            appBarColorBloc.add(GetColor(AppbarColorModal.Black));
                            setState(() {});
                          },
                          shape: CircleBorder(),
                          color: Colors.black,
                          elevation: 18,
                        ),
                        MaterialButton(
                          onPressed: () {
                            appBarColorBloc.add(GetColor(AppbarColorModal.Green));
                            setState(() {});
                          },
                          shape: CircleBorder(),
                          color: Colors.green,
                          elevation: 18,
                        ),
                        MaterialButton(
                          onPressed: () {
                            appBarColorBloc.add(GetColor(AppbarColorModal.White));
                            setState(() {});
                          },
                          shape: CircleBorder(),
                          color: Colors.white,
                          elevation: 18,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        int n = Random().nextInt(100);
                        dataBloc.add(GetData(data: icons[n % icons.length]));
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: state.color.primaryColor,
                        ),
                        child: BlocBuilder(
                          bloc: dataBloc,
                          builder: (context, DataState state2) {
                            if (state2 is InitialData)
                              return Center(
                                child: Container(
                                  height: 155,
                                  width: 155,
                                  child: Center(
                                    child: Icon(
                                      state2.data,
                                      size: 155,
                                    ),
                                  ),
                                ),
                              );
                            if (state2 is LoadingData)
                              return Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              );
                            if (state2 is LoadedData)
                              return Container(
                                height: 100,
                                width: 100,
                                child: Icon(
                                  state2.data,
                                  size: 155,
                                ),
                              );
                            else
                              return Container();
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => bloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 20,),
            FloatingActionButton(
              onPressed: () => bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        )
    );
  }
}
