import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';

class MQTTManager2 {
  final MQTTAppState2 _currentState2;
  MqttServerClient _client2;
  final String _identifier2;
  final String _host2;
  final String _topic;
  final String _topic1;
  final String _topic2;
  final String _topic3;
  final String _topic4;
  final String _topic5;
  final String _topic6;
  final String _topic7;
  final String _topic8;

  MQTTManager2(
      {@required String host2,
      @required String topic,
      @required String topic1,
      @required String topic2,
      @required String topic3,
      @required String topic4,
      @required String topic5,
      @required String topic6,
      @required String topic7,
      @required String topic8,
      @required String identifier2,
      @required MQTTAppState2 state2})
      : _identifier2 = identifier2,
        _host2 = host2,
        _topic = topic,
        _topic1 = topic1,
        _topic2 = topic2,
        _topic3 = topic3,
        _topic4 = topic4,
        _topic5 = topic5,
        _topic6 = topic6,
        _topic7 = topic7,
        _topic8 = topic8,
        _currentState2 = state2;

  void initializeMQTTClient2() {
    _client2 = MqttServerClient(_host2, _identifier2);
    _client2.port = 1883;
    _client2.keepAlivePeriod = 20;
    _client2.onDisconnected = onDisconnected;
    _client2.secure = false;
    _client2.logging(on: true);

    _client2.onConnected = onConnected;
    _client2.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier2)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    _client2.connectionMessage = connMess;
  }

  void connect() async {
    assert(_client2 != null);
    try {
      print('EXAMPLE::Mosquitto start client connecting....');
      _currentState2.setAppConnectionState2(MQTTAppConnectionState2.connecting);
      await _client2.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    print('Disconnected');
    _client2.disconnect();
  }

  void publish(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client2.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload);
  }

  void publish1(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client2.publishMessage("application/2/device/f5da3b4ea3fb20f7/tx",
        MqttQos.exactlyOnce, builder.payload);
  }

  void publish2(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client2.publishMessage("application/2/device/f5da3b4ea3fb20f7/tx",
        MqttQos.exactlyOnce, builder.payload);
  }

  void onSubscribed(String topik) {
    print('EXAMPLE::Subscription confirmed for topic $topik');
  }

  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (_client2.connectionStatus.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    _currentState2.setAppConnectionState2(MQTTAppConnectionState2.disconnected);
  }

  void onConnected() {
    _currentState2.setAppConnectionState2(MQTTAppConnectionState2.connected);
    print('EXAMPLE::Mosquitto client connected...');
    _client2.subscribe(_topic, MqttQos.atLeastOnce);
    _client2.subscribe(_topic1, MqttQos.atLeastOnce);
    _client2.subscribe(_topic2, MqttQos.atLeastOnce);
    _client2.subscribe(_topic3, MqttQos.atLeastOnce);
    _client2.subscribe(_topic4, MqttQos.atLeastOnce);
    _client2.subscribe(_topic5, MqttQos.atLeastOnce);
    _client2.subscribe(_topic6, MqttQos.atLeastOnce);
    _client2.subscribe(_topic7, MqttQos.atLeastOnce);
    _client2.subscribe(_topic8, MqttQos.atLeastOnce);
    _client2.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage reccMess = c[0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(reccMess.payload.message);
      if (c[0].topic == "node2/v1") {
        _currentState2.setReceivedText(pt);
      } else if (c[0].topic == "node2/v2") {
        _currentState2.setReceivedText1(pt);
      } else if (c[0].topic == "node2/v3") {
        _currentState2.setReceivedText2(pt);
      } else if (c[0].topic == "node2/c1") {
        _currentState2.setReceivedText3(pt);
      } else if (c[0].topic == "node2/c2") {
        _currentState2.setReceivedText4(pt);
      } else if (c[0].topic == "node2/c3") {
        _currentState2.setReceivedText5(pt);
      } else if (c[0].topic == "node2/notif") {
        _currentState2.setReceivedText8(pt);
      }
      print(
          'EXAMPLE:: CHANGE NOTIFICATION::  topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
  }
}
