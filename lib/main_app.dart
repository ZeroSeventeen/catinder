import 'cat_container.dart';
import 'package:flutter/material.dart';
import 'tools/utils.dart';
import 'info_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _likesCounter = 0;

  @override
  Widget build(BuildContext context) {
    Utils.setSize(context);
    return MaterialApp(
      routes: {
        '/main':(BuildContext context) => MainApp(),
        '/info':(BuildContext context) => InfoPage()
      },
      home: Scaffold(
          body: Center(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: Utils.widgetWidth,
                  height: Utils.widgetHeight,
                  child:  CatContainerSecond()
                ),
            )
          ),
      )
    );
  }

  void _incrementCounter() {
    setState(() {
      _likesCounter++;
    });
  }
}