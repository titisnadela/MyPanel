import 'package:flutter/material.dart';
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:tes/widgets/mqttView.dart';
import 'package:provider/provider.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  get manager2 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Node 1",
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
                      return ChangeNotifierProvider<MQTTAppState>(
                        create: (_) => MQTTAppState(),
                        child: MQTTView(),
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
