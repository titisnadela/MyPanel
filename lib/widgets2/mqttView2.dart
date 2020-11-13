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
  MQTTAppState2 currentAppState2;
  MQTTManager2 manager2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    manager2.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState2 appState2 = Provider.of<MQTTAppState2>(context);
    currentAppState2 = appState2;
    print(currentAppState2.getAppConnectionState2);
    if (currentAppState2.getAppConnectionState2 ==
        MQTTAppConnectionState2.disconnected) _configureAndConnect();

    final Scaffold scaffold2 = Scaffold(
      appBar: _buildAppBar2(context),
      body: _buildColumn2(),
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
    return ListView(children: <Widget>[
      Chart2(
        data: currentAppState2.getData,
        data1: currentAppState2.getData1,
        data2: currentAppState2.getData2,
        //data2: context.watch<MQTTAppState2>().getData2,
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
        //topic6: 'node2/light',
        topic6: 'application/2/device/f5da3b4ea3fb20f7/tx',
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

  // void _publishMessage(String text) {
  //   String osPrefix = 'Flutter_iOS';
  //   if (Platform.isAndroid) {
  //     osPrefix = 'Flutter_Android';
  //   }
  //   final String message = osPrefix + ' says: ' + text;
  //   manager2.publish(message);
  //   _messageTextContoller2.clear();
  // }

  void _publishMessage(String text) {
    manager2.publish(text);
  }
}
