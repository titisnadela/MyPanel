import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';

class MQTTManager3 {
  final MQTTAppState3 _currentState3;
  MqttServerClient _client3;
  final String _identifier3;
  final String _host3;
  final String _topik;
  final String _topik1;

  MQTTManager3(
      {@required String host3,
      @required String topik,
      @required String topik1,
      @required String identifier3,
      @required MQTTAppState3 state3})
      : _identifier3 = identifier3,
        _host3 = host3,
        _topik = topik,
        _topik1 = topik1,
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
    _client3.publishMessage(_topik, MqttQos.exactlyOnce, builder.payload);
  }

  void onSubscribed(String topik) {
    print('EXAMPLE::Subscription confirmed for topic $topik');
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
    _client3.subscribe(_topik, MqttQos.atLeastOnce);
    _client3.subscribe(_topik1, MqttQos.atLeastOnce);
    _client3.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage reccMess = c[0].payload;
      final String ptt =
          MqttPublishPayload.bytesToStringAsString(reccMess.payload.message);
      if (c[0].topic == 'topic/temp') {
        _currentState3.setReceivedTextc(ptt);
      } else if (c[0].topic == 'topic/hum') {
        _currentState3.setReceivedTextc1(ptt);
      }
      print(
          'EXAMPLE:: CHANGE NOTIFICATION::  topic is <${c[0].topic}>, payload is <-- $ptt -->');
      print('');
    });
  }
}
