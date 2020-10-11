import 'dart:io' show Platform;
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
  final TextEditingController _topikTextController = TextEditingController();
  final TextEditingController _topik1TextController = TextEditingController();
  MQTTAppState3 currentAppState3;
  //MQTTAppState2 currentAppState21;
  MQTTManager3 manager3;

  @override
  void initState() {
    super.initState();
    _hostTextController3.text = '192.168.43.229';
    _topikTextController.text = 'topic/temp';
    _topik1TextController.text = 'topic/hum';
  }

  @override
  void dispose() {
    _hostTextController3.dispose();
    _messageTextContoller3.dispose();
    _topikTextController.dispose();
    _topik1TextController.dispose();
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
      backgroundColor: Colors.green[200],
    );
    return scaffold3;
  }

  Widget _buildAppBar3(BuildContext context) {
    return AppBar(
      title: const Text('MQTT'),
      backgroundColor: Colors.greenAccent,
    );
  }

  Widget _buildColumn3() {
    return ListView(
      children: <Widget>[
        Chart3(
          data: currentAppState3.getData,
          data1: currentAppState3.getData1,
          titles: currentAppState3.getTitles,
          titles1: currentAppState3.getTitles1,
          maxData: currentAppState3.maxData,
          maxData1: currentAppState3.maxData1,
        )
      ],
    );
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
              _topikTextController,
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
        (controller == _topikTextController &&
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

  Future refreshData() async {
    // ignore: unnecessary_statements
    _hostTextController3;
    // ignore: unnecessary_statements
    _topikTextController;
    // ignore: unnecessary_statements
    _topik1TextController;
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
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
        topik: 'topic/temp',
        topik1: 'topic/hum',
        identifier3: osPrefix,
        state3: currentAppState3);
    manager3.initializeMQTTClient3();
    manager3.connect();
  }

  void _disconnect() {
    manager3.disconnect();
  }

  void _publishMessage(String text) {
    String osPrefix = 'Flutter_iOS';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_Android';
    }
    final String message = osPrefix + ' says: ' + text;
    manager3.publish(message);
    _messageTextContoller3.clear();
  }
}
