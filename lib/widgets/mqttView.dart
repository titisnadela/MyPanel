import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes/chart.dart';
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:tes/mqtt/MQTTManager.dart';

class MQTTView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MQTTViewState();
  }
}

class _MQTTViewState extends State<MQTTView> {
  final TextEditingController _hostTextController = TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();
  final TextEditingController _topicTextController = TextEditingController();
  MQTTAppState currentAppState;
  //MQTTAppState currentAppState1;
  MQTTManager manager;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    manager.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;

    if (currentAppState.getAppConnectionState ==
        MQTTAppConnectionState.disconnected) _configureAndConnect();

    final Scaffold scaffold = Scaffold(
      appBar: _buildAppBar(context),
      body: _buildColumn(),
      backgroundColor: Color(0xFFF1F8E9),
    );
    return scaffold;
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Node 1'),
      backgroundColor: Color(0xFF558B2F),
    );
  }

  Widget _buildColumn() {
    return ListView(children: <Widget>[
      Chart(
        data: currentAppState.getData,
        data1: currentAppState.getData1,
        data2: currentAppState.getData2,
        data3: currentAppState.getData3,
        data4: currentAppState.getData4,
        data5: currentAppState.getData5,
        data6: currentAppState.getData6,
        data7: currentAppState.getData7,
        data8: currentAppState.getData8,
        titles: currentAppState.getTitles,
        titles1: currentAppState.getTitles1,
        maxData: currentAppState.maxData,
        maxData1: currentAppState.maxData1,
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

  Widget buildEditableColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _buildTextFieldWith(_hostTextController, 'Enter broker address',
              currentAppState.getAppConnectionState),
          const SizedBox(height: 10),
          _buildTextFieldWith(
              _topicTextController,
              'Enter a topic to subscribe or listen',
              currentAppState.getAppConnectionState),
          const SizedBox(height: 10),
          _buildPublishMessageRow(),
          const SizedBox(height: 10),
          _buildConnectedButtonFrom(currentAppState.getAppConnectionState)
        ],
      ),
    );
  }

  Widget _buildPublishMessageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith(_messageTextController, 'Enter a message',
              currentAppState.getAppConnectionState),
        ),
        _buildSendButtonFrom(currentAppState.getAppConnectionState)
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
        ),
      ],
    );
  }

  Widget _buildTextFieldWith(TextEditingController controller, String hintText,
      MQTTAppConnectionState state) {
    bool shouldEnable = false;
    if (controller == _messageTextController &&
        state == MQTTAppConnectionState.connected) {
      shouldEnable = true;
    } else if ((controller == _hostTextController &&
            state == MQTTAppConnectionState.disconnected) ||
        (controller == _topicTextController &&
            state == MQTTAppConnectionState.disconnected)) {
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

  Widget _buildConnectedButtonFrom(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Colors.lightBlueAccent,
            child: const Text('Connect'),
            onPressed: state == MQTTAppConnectionState.disconnected
                ? _configureAndConnect
                : null, //
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RaisedButton(
            color: Colors.redAccent,
            child: const Text('Disconnect'),
            onPressed: state == MQTTAppConnectionState.connected
                ? _disconnect
                : null, //
          ),
        ),
      ],
    );
  }

  Widget _buildSendButtonFrom(MQTTAppConnectionState state) {
    return RaisedButton(
      color: Colors.green,
      child: const Text('Send'),
      onPressed: state == MQTTAppConnectionState.connected
          ? () {
              _publishMessage(_messageTextController.text);
            }
          : null, //
    );
  }

  // Utility functions
  // ignore: missing_return
  String prepareStateMessageFrom(MQTTAppConnectionState state) {
    switch (state) {
      case MQTTAppConnectionState.connected:
        return 'Connected';
      case MQTTAppConnectionState.connecting:
        return 'Connecting';
      case MQTTAppConnectionState.disconnected:
        return 'Disconnected';
    }
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

  void _disconnect() {
    manager.disconnect();
  }

  // void _publishMessage(String text) {
  //   String osPrefix = 'Flutter_iOS';
  //   if (Platform.isAndroid) {
  //     osPrefix = 'Flutter_Android';
  //   }
  //   final String message = osPrefix + ' says: ' + text;
  //   manager.publish(message);
  //   _messageTextController.clear();
  // }
  void _publishMessage(String text) {
    manager.publish(text);
  }
}
