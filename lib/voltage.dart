import 'package:flutter/material.dart';

class Voltage extends StatefulWidget {
  @override
  _VoltageState createState() => _VoltageState();
}

class _VoltageState extends State<Voltage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text(
          "MyPanel",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xFF558B2F),
      ),
    );
  }
}
