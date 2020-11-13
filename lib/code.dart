import 'package:flutter/material.dart';
import 'package:tes/mqtt/MQTTManager.dart';
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:tes/widgets/mqttView.dart';
import 'package:provider/provider.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  MQTTAppState currentAppState;

  MQTTManager manager;

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;
    if (currentAppState.getAppConnectionState ==
        MQTTAppConnectionState.disconnected) _configureAndConnect();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Node 1",
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
                        image: AssetImage('assets/1.png'),
                        width: 100,
                        height: 100,
                      ),
                    ),
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
                ]),
          ],
        ));
  }

  void _configureAndConnect() {
    // ignore: flutter_style_todos
    String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    manager = MQTTManager(
        // host: _hostTextController.text,
        // topic: _topicTextController.text,
        host: '192.168.43.229',
        topic: 'node1/v1',
        topic1: 'node1/v2',
        topic2: 'node1/v3',
        topic3: 'node1/c1',
        topic4: 'node1/c2',
        topic5: 'node1/c3',
        topic6: 'application/2/device/b03d377b1e3ac153/tx',
        topic7: 'node1/off',
        topic8: 'node1/notif',
        identifier: osPrefix,
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void _publishMessage(String text) {
    manager.publish(text);
  }
}
