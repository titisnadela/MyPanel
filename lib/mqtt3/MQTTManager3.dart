import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';

class MQTTManager3 {
  final MQTTAppState3 _currentState3;
  MqttServerClient _client3;
  final String _identifier3;
  final String _host3;
  final String _topic;
  final String _topic1;
  final String _topic2;
  final String _topic3;
  final String _topic4;
  final String _topic5;
  final String _topic6;
  final String _topic7;
  final String _topic8;

  MQTTManager3(
      {@required String host3,
      @required String topic,
      @required String topic1,
      @required String topic2,
      @required String topic3,
      @required String topic4,
      @required String topic5,
      @required String topic6,
      @required String topic7,
      @required String topic8,
      @required String identifier3,
      @required MQTTAppState3 state3})
      : _identifier3 = identifier3,
        _host3 = host3,
        _topic = topic,
        _topic1 = topic1,
        _topic2 = topic2,
        _topic3 = topic3,
        _topic4 = topic4,
        _topic5 = topic5,
        _topic6 = topic6,
        _topic7 = topic7,
        _topic8 = topic8,
        _currentState3 = state3;

  void initializeMQTTClient3() {
    _client3 = MqttServerClient(_host3, _identifier3);
    _client3.port = 1883;
    _client3.keepAlivePeriod = 20;
    _client3.onDisconnected = onDisconnected;
    _client3.secure = false;
    _client3.logging(on: true);

    _client3.onConnected = onConnected;
    _client3.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier3)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    _client3.connectionMessage = connMess;
  }

  void connect() async {
    assert(_client3 != null);
    try {
      print('EXAMPLE::Mosquitto start client connecting....');
      _currentState3.setAppConnectionState3(MQTTAppConnectionState3.connecting);
      await _client3.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    print('Disconnected');
    _client3.disconnect();
  }

  void publish(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client3.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload);
  }

  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (_client3.connectionStatus.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    _currentState3.setAppConnectionState3(MQTTAppConnectionState3.disconnected);
  }

  void onConnected() {
    _currentState3.setAppConnectionState3(MQTTAppConnectionState3.connected);
    print('EXAMPLE::Mosquitto client connected...');
    _client3.subscribe(_topic, MqttQos.atLeastOnce);
    _client3.subscribe(_topic1, MqttQos.atLeastOnce);
    _client3.subscribe(_topic2, MqttQos.atLeastOnce);
    _client3.subscribe(_topic3, MqttQos.atLeastOnce);
    _client3.subscribe(_topic4, MqttQos.atLeastOnce);
    _client3.subscribe(_topic5, MqttQos.atLeastOnce);
    _client3.subscribe(_topic6, MqttQos.atLeastOnce);
    _client3.subscribe(_topic7, MqttQos.atLeastOnce);
    _client3.subscribe(_topic8, MqttQos.atLeastOnce);
    _client3.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage reccMess = c[0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(reccMess.payload.message);
      if (c[0].topic == "node3/v1") {
        _currentState3.setReceivedText(pt);
      } else if (c[0].topic == "node3/v2") {
        _currentState3.setReceivedText1(pt);
      } else if (c[0].topic == "node3/v3") {
        _currentState3.setReceivedText2(pt);
      } else if (c[0].topic == "node3/c1") {
        _currentState3.setReceivedText3(pt);
      } else if (c[0].topic == "node3/c2") {
        _currentState3.setReceivedText4(pt);
      } else if (c[0].topic == "node3/c3") {
        _currentState3.setReceivedText5(pt);
      } else if (c[0].topic == "node3/light") {
        _currentState3.setReceivedText6(pt);
      } else if (c[0].topic == "node3/off") {
        _currentState3.setReceivedText7(pt);
      } else if (c[0].topic == "node3/notif") {
        _currentState3.setReceivedText8(pt);
      }
      print(
          'EXAMPLE:: CHANGE NOTIFICATION::  topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
  }
}
