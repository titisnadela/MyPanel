//import 'dart:io' show Platform;
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';
import 'package:tes/widgets2/mqttView2.dart';

class Code2 extends StatefulWidget {
  @override
  _Code2State createState() => _Code2State();
}

class _Code2State extends State<Code2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF1F8E9),
        appBar: AppBar(
          title: Text(
            "MyPanel",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xff558b2f),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 411,
                  height: 50,
                  color: Color(0xfff1f8e9),
                  alignment: FractionalOffset(0.025, 0.5),
                  child: Text(
                    "Node 2",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green[800],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChangeNotifierProvider<MQTTAppState2>(
                        create: (_) => MQTTAppState2(),
                        child: MQTTView2(),
                      );
                    }));
                  },
                  child: Text(
                    "Grafik",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
