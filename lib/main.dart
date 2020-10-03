import 'package:flutter/material.dart';

//import 'package:tes/home.dart';
import 'package:tes/login.dart';
//import 'package:tes/mqtt.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => Home(),
        '/MainPage': (BuildContext context) => MainPage(),
      },
    );
  }
}
