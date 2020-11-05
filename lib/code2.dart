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
  get manager2 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Node 2",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xFF558B2F),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Text("network"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.lightGreen[700],
                  onPressed: () {
                    _publishMessage(
                        '{"confirmed":true, "fPort":3, "data":"MQ=="}');
                  },
                  child: Text(
                    "On",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.lightGreen[700],
                  onPressed: () {
                    _publishMessage1(
                        '{"confirmed":true, "fPort":3, "data":"MA=="}');
                  },
                  child: Text(
                    "Off",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.lightGreen[700],
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

  void _publishMessage(String text) {
    manager2.publish2(text);
  }

  void _publishMessage1(String text) {
    manager2.publish2(text);
  }
}
