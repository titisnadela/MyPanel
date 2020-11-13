import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tes/mqtt2/MQTTManager2.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';
import 'package:tes/widgets2/mqttView2.dart';

class Code2 extends StatefulWidget {
  @override
  _Code2State createState() => _Code2State();
}

class _Code2State extends State<Code2> {
  MQTTAppState2 currentAppState2;

  MQTTManager2 manager2;

  @override
  void dispose() {
    manager2.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState2 appState2 = Provider.of<MQTTAppState2>(context);
    currentAppState2 = appState2;
    if (currentAppState2.getAppConnectionState2 ==
        MQTTAppConnectionState2.disconnected) _configureAndConnect();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Node 2",
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
    manager2 = MQTTManager2(
        // host: _hostTextController.text,
        // topic: _topicTextController.text,
        host2: '192.168.43.229',
        topic: 'node2/v1',
        topic1: 'node2/v2',
        topic2: 'node2/v3',
        topic3: 'node2/c1',
        topic4: 'node2/c2',
        topic5: 'node2/c3',
        topic6: 'application/2/device/f5da3b4ea3fb20f7/tx',
        topic7: 'node/light',
        topic8: 'node/off',
        identifier2: osPrefix,
        state2: currentAppState2);
    manager2.initializeMQTTClient2();
    manager2.connect();
  }

  void _publishMessage(String text) {
    manager2.publish(text);
  }
}
