import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';
import 'mqtt3/state3/MQTTAppState3.dart';
import 'package:tes/widgets3/mqttView3.dart';

class Code3 extends StatefulWidget {
  @override
  _Code3State createState() => _Code3State();
}

class _Code3State extends State<Code3> {
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
                    "Node 3",
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
                      return ChangeNotifierProvider<MQTTAppState3>(
                        create: (_) => MQTTAppState3(),
                        child: MQTTView3(),
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
