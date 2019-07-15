import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'simple_page_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'router://flutter/firstpage': (pageName, params, _) => FirstRouteWidget(),
      'router://flutter/secondpage': (pageName, params, _) => SecondRouteWidget(),
      'router://flutter/tabpage': (pageName, params, _) => TabRouteWidget()
    });

    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(),
        home: Container(
          color: Colors.white,
        ));
  }
}
