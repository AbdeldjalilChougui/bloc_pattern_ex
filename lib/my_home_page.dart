import 'package:blocpatternex/flutter_bloc_blocprovider/second_color_bloc.dart';
import 'package:blocpatternex/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MainScreen(),
    );
  }
}