import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes/chart3.dart';
import 'package:tes/mqtt3/MQTTManager3.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';

class MQTTView3 extends StatefulWidget {
  @override
  _MQTTView3State createState() {
    return _MQTTView3State();
  }
}

class _MQTTView3State extends State<MQTTView3> {
  final TextEditingController _hostTextController3 = TextEditingController();
  final TextEditingController _messageTextContoller3 = TextEditingController();
  final TextEditingController _topicTextController = TextEditingController();

  MQTTAppState3 currentAppState3;
  //MQTTAppState2 currentAppState21;
  MQTTManager3 manager3;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    manager3.disconnect();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState3 appState3 = Provider.of<MQTTAppState3>(context);
    currentAppState3 = appState3;

    if (currentAppState3.getAppConnectionState3 ==
        MQTTAppConnectionState3.disconnected) _configureAndConnect();

    final Scaffold scaffold3 = Scaffold(
      appBar: _buildAppBar3(context),
      body: _buildColumn3(),
      backgroundColor: Color(0xFFF1F8E9),
    );
    return scaffold3;
  }

  Widget _buildAppBar3(BuildContext context) {
    return AppBar(
      title: const Text('Node 3'),
      backgroundColor: Color(0xFF558B2F),
    );
  }

  Widget _buildColumn3() {
    return ListView(children: <Widget>[
      Chart3(
        data: currentAppState3.getData,
        data1: currentAppState3.getData1,
        data2: currentAppState3.getData2,
        data3: currentAppState3.getData3,
        data4: currentAppState3.getData4,
        data5: currentAppState3.getData5,
        data6: currentAppState3.getData6,
        data7: currentAppState3.getData7,
        data8: currentAppState3.getData8,
        titles: currentAppState3.getTitles,
        titles1: currentAppState3.getTitles1,
        maxData: currentAppState3.maxData,
        maxData1: currentAppState3.maxData1,
      ),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              Image(
                image: AssetImage('assets/line1.png'),
                width: 20,
                height: 20,
              ),
              Text('Solar Panel'),
            ],
          ),
          Column(
            children: [
              Image(
                image: AssetImage('assets/line2.png'),
                width: 20,
                height: 20,
              ),
              Text('Battery'),
            ],
          ),
          Column(
            children: [
              Image(
                image: AssetImage('assets/line3.png'),
                width: 20,
                height: 20,
              ),
              Text('Appliance'),
            ],
          ),
        ],
      ),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: Image(
                image: AssetImage(
                  'assets/nyala.png',
                ),
                width: 50,
                height: 50,
              ),
            ),
            RaisedButton(
              color: Colors.lightGreen[700],
              onPressed: () {
                _publishMessage('{"confirmed":true, "fPort":3, "data":"MQ=="}');
              },
              child: Text(
                "On",
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: Image(
                  image: AssetImage(
                    'assets/matii.png',
                  ),
                  width: 50,
                  height: 50,
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
            ],
          ),
        ],
      )
    ]);
  }

  Widget buildEditableColumn3() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildTextFieldWith3(_hostTextController3, 'Enter broker address',
              currentAppState3.getAppConnectionState3),
          const SizedBox(height: 10),
          _buildTextFieldWith3(
              _topicTextController,
              'Enter a topic to subscribe or listen',
              currentAppState3.getAppConnectionState3),
          const SizedBox(height: 10),
          _buildPublishMessageRow3(),
          const SizedBox(height: 10),
          _buildConnectedButtonFrom(currentAppState3.getAppConnectionState3)
        ],
      ),
    );
  }

  Widget _buildPublishMessageRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith3(_messageTextContoller3, 'Enter a message',
              currentAppState3.getAppConnectionState3),
        ),
        _buildSendButtonFrom3(currentAppState3.getAppConnectionState3)
      ],
    );
  }

  Widget buildConnectionStateText(String status) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.deepOrangeAccent,
              child: Text(status, textAlign: TextAlign.center)),
        )
      ],
    );
  }

  Widget _buildTextFieldWith3(TextEditingController controller, String hintText,
      MQTTAppConnectionState3 state3) {
    bool shouldEnable = false;
    if (controller == _messageTextContoller3 &&
        state3 == MQTTAppConnectionState3.connected) {
      shouldEnable = true;
    } else if ((controller == _hostTextController3 &&
            state3 == MQTTAppConnectionState3.disconnected) ||
        (controller == _topicTextController &&
            state3 == MQTTAppConnectionState3.disconnected)) {
      shouldEnable = true;
    }
    return TextField(
        enabled: shouldEnable,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
          labelText: hintText,
        ));
  }

  Widget buildScrollableTextWith(String text) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 100,
        height: 400,
        child: SingleChildScrollView(
          child: Text(text),
        ),
      ),
    );
  }

  Widget _buildConnectedButtonFrom(MQTTAppConnectionState3 state) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Colors.lightBlueAccent,
            child: const Text('Connect'),
            onPressed: state == MQTTAppConnectionState3.disconnected
                ? _configureAndConnect
                : null, //
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RaisedButton(
            color: Colors.redAccent,
            child: const Text('Disconnect'),
            onPressed: state == MQTTAppConnectionState3.connected
                ? _disconnect
                : null, //
          ),
        ),
      ],
    );
  }

  Widget _buildSendButtonFrom3(MQTTAppConnectionState3 state3) {
    return RaisedButton(
      color: Colors.green,
      child: const Text('Send'),
      onPressed: state3 == MQTTAppConnectionState3.connected
          ? () {
              _publishMessage(_messageTextContoller3.text);
            }
          : null, //
    );
  }

  // Utility functions
  // ignore: missing_return
  String prepareStateMessageFrom(MQTTAppConnectionState3 state3) {
    switch (state3) {
      case MQTTAppConnectionState3.connected:
        return 'Connected';
      case MQTTAppConnectionState3.connecting:
        return 'Connecting';
      case MQTTAppConnectionState3.disconnected:
        return 'Disconnected';
    }
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
        topic7: 'node3/off',
        topic8: 'node3/notif',
        identifier3: osPrefix,
        state3: currentAppState3);
    manager3.initializeMQTTClient3();
    manager3.connect();
  }

  void _disconnect() {
    manager3.disconnect();
  }

  // void _publishMessage(String text) {
  //   String osPrefix = 'Flutter_iOS';
  //   if (Platform.isAndroid) {
  //     osPrefix = 'Flutter_Android';
  //   }
  //   final String message = osPrefix + ' says: ' + text;
  //   manager3.publish(message);
  //   _messageTextContoller3.clear();
  // }
  void _publishMessage(String text) {
    manager3.publish(text);
  }
}
