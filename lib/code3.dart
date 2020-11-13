import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tes/mqtt3/MQTTManager3.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';
import 'package:tes/widgets3/mqttView3.dart';

class Code3 extends StatefulWidget {
  @override
  _Code3State createState() => _Code3State();
}

class _Code3State extends State<Code3> {
  MQTTAppState3 currentAppState3;

  MQTTManager3 manager3;

  @override
  Widget build(BuildContext context) {
    final MQTTAppState3 appState3 = Provider.of<MQTTAppState3>(context);
    currentAppState3 = appState3;
    if (currentAppState3.getAppConnectionState3 ==
        MQTTAppConnectionState3.disconnected) _configureAndConnect();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Node 3",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xFF558B2F),
        ),
        body: Stack(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                      child: Image(
                        image: AssetImage(
                          'assets/1.png',
                        ),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Row(children: [
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
                    ]),
                  ]),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                      child: Image(
                        image: AssetImage(
                          'assets/2.png',
                        ),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    RaisedButton(
                      color: Colors.lightGreen[700],
                      onPressed: () {
                        _publishMessage(
                            '{"confirmed":true, "fPort":3, "data":"MA=="}');
                      },
                      child: Text(
                        "Off",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        child: Image(
                          image: AssetImage(
                            'assets/3.png',
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      RaisedButton(
                        color: Colors.lightGreen[700],
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
                ])
          ],
        ));
  }

  void _configureAndConnect() {
    // ignore: flutter_style_todos
    String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    manager3 = MQTTManager3(
        // host: _hostTextController.text,
        // topic: _topicTextController.text,
        host3: '192.168.43.229',
        topic: 'node3/v1',
        topic1: 'node3/v2',
        topic2: 'node3/v3',
        topic3: 'node3/c1',
        topic4: 'node3/c2',
        topic5: 'node3/c3',
        topic6: 'application/2/device/07e7755e043e5f1b/tx',
        topic7: 'node/light',
        topic8: 'node/off',
        identifier3: osPrefix,
        state3: currentAppState3);
    manager3.initializeMQTTClient3();
    manager3.connect();
  }

  void _publishMessage(String text) {
    manager3.publish(text);
  }
}
