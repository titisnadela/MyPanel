import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes/chart2.dart';
import 'package:tes/mqtt2/MQTTManager2.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';

class MQTTView2 extends StatefulWidget {
  @override
  _MQTTView2State createState() {
    return _MQTTView2State();
  }
}

class _MQTTView2State extends State<MQTTView2> {
  final TextEditingController _hostTextController2 = TextEditingController();
  final TextEditingController _messageTextContoller2 = TextEditingController();
  final TextEditingController _topikTextController = TextEditingController();
  final TextEditingController _topik1TextController = TextEditingController();
  MQTTAppState2 currentAppState2;
  //MQTTAppState2 currentAppState21;
  MQTTManager2 manager2;

  @override
  void initState() {
    super.initState();
    _hostTextController2.text = '192.168.43.229';
    _topikTextController.text = 'topic/temp';
    _topik1TextController.text = 'topic/hum';
  }

  @override
  void dispose() {
    _hostTextController2.dispose();
    _messageTextContoller2.dispose();
    _topikTextController.dispose();
    _topik1TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState2 appState2 = Provider.of<MQTTAppState2>(context);
    currentAppState2 = appState2;

    if (currentAppState2.getAppConnectionState2 ==
        MQTTAppConnectionState2.disconnected) _configureAndConnect();

    final Scaffold scaffold2 = Scaffold(
      appBar: _buildAppBar2(context),
      body: _buildColumn2(),
      backgroundColor: Colors.green[200],
    );
    return scaffold2;
  }

  Widget _buildAppBar2(BuildContext context) {
    return AppBar(
      title: const Text('MQTT'),
      backgroundColor: Colors.greenAccent,
    );
  }

  Widget _buildColumn2() {
    return ListView(
      children: <Widget>[
        Chart2(
          data: currentAppState2.getData,
          data1: currentAppState2.getData1,
          titles: currentAppState2.getTitles,
          titles1: currentAppState2.getTitles1,
          maxData: currentAppState2.maxData,
          maxData1: currentAppState2.maxData1,
        )
      ],
    );
  }

  Widget buildEditableColumn2() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildTextFieldWith2(_hostTextController2, 'Enter broker address',
              currentAppState2.getAppConnectionState2),
          const SizedBox(height: 10),
          _buildTextFieldWith2(
              _topikTextController,
              'Enter a topic to subscribe or listen',
              currentAppState2.getAppConnectionState2),
          const SizedBox(height: 10),
          _buildPublishMessageRow2(),
          const SizedBox(height: 10),
          _buildConnectedButtonFrom(currentAppState2.getAppConnectionState2)
        ],
      ),
    );
  }

  Widget _buildPublishMessageRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith2(_messageTextContoller2, 'Enter a message',
              currentAppState2.getAppConnectionState2),
        ),
        _buildSendButtonFrom2(currentAppState2.getAppConnectionState2)
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

  Widget _buildTextFieldWith2(TextEditingController controller, String hintText,
      MQTTAppConnectionState2 state2) {
    bool shouldEnable = false;
    if (controller == _messageTextContoller2 &&
        state2 == MQTTAppConnectionState2.connected) {
      shouldEnable = true;
    } else if ((controller == _hostTextController2 &&
            state2 == MQTTAppConnectionState2.disconnected) ||
        (controller == _topikTextController &&
            state2 == MQTTAppConnectionState2.disconnected)) {
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

  Widget _buildConnectedButtonFrom(MQTTAppConnectionState2 state2) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Colors.lightBlueAccent,
            child: const Text('Connect'),
            onPressed: state2 == MQTTAppConnectionState2.disconnected
                ? _configureAndConnect
                : null, //
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RaisedButton(
            color: Colors.redAccent,
            child: const Text('Disconnect'),
            onPressed: state2 == MQTTAppConnectionState2.connected
                ? _disconnect
                : null, //
          ),
        ),
      ],
    );
  }

  Widget _buildSendButtonFrom2(MQTTAppConnectionState2 state2) {
    return RaisedButton(
      color: Colors.green,
      child: const Text('Send'),
      onPressed: state2 == MQTTAppConnectionState2.connected
          ? () {
              _publishMessage(_messageTextContoller2.text);
            }
          : null, //
    );
  }

  // Utility functions
  // ignore: missing_return
  String prepareStateMessageFrom(MQTTAppConnectionState2 state2) {
    switch (state2) {
      case MQTTAppConnectionState2.connected:
        return 'Connected';
      case MQTTAppConnectionState2.connecting:
        return 'Connecting';
      case MQTTAppConnectionState2.disconnected:
        return 'Disconnected';
    }
  }

  Future refreshData() async {
    // ignore: unnecessary_statements
    _hostTextController2;
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
    manager2 = MQTTManager2(
        // host: _hostTextController.text,
        // topic: _topicTextController.text,
        host2: '192.168.43.229',
        topik: 'topic/temp',
        topik1: 'topic/hum',
        identifier2: osPrefix,
        state2: currentAppState2);
    manager2.initializeMQTTClient2();
    manager2.connect();
  }

  void _disconnect() {
    manager2.disconnect();
  }

  void _publishMessage(String text) {
    String osPrefix = 'Flutter_iOS';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_Android';
    }
    final String message = osPrefix + ' says: ' + text;
    manager2.publish(message);
    _messageTextContoller2.clear();
  }
}
