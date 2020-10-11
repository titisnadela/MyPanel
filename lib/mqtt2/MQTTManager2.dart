import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';

class MQTTManager2 {
  final MQTTAppState2 _currentState2;
  MqttServerClient _client2;
  final String _identifier2;
  final String _host2;
  final String _topik;
  final String _topik1;

  MQTTManager2(
      {@required String host2,
      @required String topik,
      @required String topik1,
      @required String identifier2,
      @required MQTTAppState2 state2})
      : _identifier2 = identifier2,
        _host2 = host2,
        _topik = topik,
        _topik1 = topik1,
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
    _client2.publishMessage(_topik, MqttQos.exactlyOnce, builder.payload);
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
    _client2.subscribe(_topik, MqttQos.atLeastOnce);
    _client2.subscribe(_topik1, MqttQos.atLeastOnce);
    _client2.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage reccMess = c[0].payload;
      final String ptt =
          MqttPublishPayload.bytesToStringAsString(reccMess.payload.message);
      if (c[0].topic == 'topic/temp') {
        _currentState2.setReceivedTextc(ptt);
      } else if (c[0].topic == 'topic/hum') {
        _currentState2.setReceivedTextc1(ptt);
      }
      print(
          'EXAMPLE:: CHANGE NOTIFICATION::  topic is <${c[0].topic}>, payload is <-- $ptt -->');
      print('');
    });
  }
}
