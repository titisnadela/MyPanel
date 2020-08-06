import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: FlatButton(
            color: Colors.amber,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali")),
      ),
    );
  }
}
