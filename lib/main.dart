import 'package:flutter/material.dart';
import 'package:mysqldatabase/screens/Dashboard.dart';

import 'screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
      routes: {
        '/home': (ctx) => Home(),
        "/dashboard": (ctx) => Dashboard(),
      },
    );
  }
}
