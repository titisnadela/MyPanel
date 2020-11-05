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
  final TextEditingController _topicTextController = TextEditingController();
  final TextEditingController _topic1TextController = TextEditingController();
  final TextEditingController _topic2TextController = TextEditingController();
  final TextEditingController _topic3TextController = TextEditingController();
  final TextEditingController _topic4TextController = TextEditingController();
  final TextEditingController _topic5TextController = TextEditingController();
  final TextEditingController _topic6TextController = TextEditingController();
  final TextEditingController _topic7TextController = TextEditingController();
  final TextEditingController _topic8TextController = TextEditingController();
  MQTTAppState2 currentAppState2;
  //MQTTAppState2 currentAppState21;
  MQTTManager2 manager2;

  @override
  void initState() {
    super.initState();
    _hostTextController2.text = '192.168.43.229';
    _topicTextController.text = 'node2/v1';
    _topic1TextController.text = 'node2/v2';
    _topic2TextController.text = 'node2/v3';
    _topic3TextController.text = 'node2/c1';
    _topic4TextController.text = 'node2/c2';
    _topic5TextController.text = 'node2/c3';
    _topic6TextController.text = 'node2/light';
    _topic7TextController.text = 'node2/off';
    _topic8TextController.text = 'node2/notif';
  }

  @override
  void dispose() {
    _hostTextController2.dispose();
    _messageTextContoller2.dispose();
    _topicTextController.dispose();
    _topic1TextController.dispose();
    _topic2TextController.dispose();
    _topic3TextController.dispose();
    _topic4TextController.dispose();
    _topic5TextController.dispose();
    _topic6TextController.dispose();
    _topic7TextController.dispose();
    _topic8TextController.dispose();
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
      //backgroundColor: Colors.black,
      backgroundColor: Color(0xFFF1F8E9),
    );
    return scaffold2;
  }

  Widget _buildAppBar2(BuildContext context) {
    return AppBar(
      title: const Text('Node 2'),
      backgroundColor: Color(0xFF558B2F),
    );
  }

  Widget _buildColumn2() {
    return ListView(
      children: <Widget>[
        Chart2(
          data: currentAppState2.getData,
          data1: currentAppState2.getData1,
          data2: currentAppState2.getData2,
          data3: currentAppState2.getData3,
          data4: currentAppState2.getData4,
          data5: currentAppState2.getData5,
          data6: currentAppState2.getData6,
          data7: currentAppState2.getData7,
          data8: currentAppState2.getData8,
          titles: currentAppState2.getTitles,
          titles1: currentAppState2.getTitles1,
          maxData: currentAppState2.maxData,
          maxData1: currentAppState2.maxData1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: AssetImage('assets/line1.png'),
              width: 20,
              height: 20,
            ),
            Image(
              image: AssetImage('assets/line2.png'),
              width: 20,
              height: 20,
            ),
            Image(
              image: AssetImage('assets/line3.png'),
              width: 20,
              height: 20,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('  solar panel'),
            Text('battery  '),
            Text('output      '),
          ],
        ),
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
              _topicTextController,
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
        (controller == _topicTextController &&
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
        topic6: 'node2/light',
        topic7: 'node2/off',
        topic8: 'node2/notif',
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
