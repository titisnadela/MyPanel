import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager {
  // Private instance of client
  final MQTTAppState _currentState;
  MqttServerClient _client;
  final String _identifier;
  final String _host;
  final String _topic;
  final String _topic1;
  // ignore: unused_field
  final String _topic2;
  // ignore: unused_field
  final String _topic3;
  // ignore: unused_field
  final String _topic4;
  // ignore: unused_field
  final String _topic5;
  // ignore: unused_field
  final String _topic6;
  // ignore: unused_field
  final String _topic7;
  // ignore: unused_field
  final String _topic8;

  MQTTManager(
      {@required String host,
      @required String topic,
      @required String topic1,
      @required String topic2,
      @required String topic3,
      @required String topic4,
      @required String topic5,
      @required String topic6,
      @required String topic7,
      @required String topic8,
      @required String identifier,
      @required MQTTAppState state})
      : _identifier = identifier,
        _host = host,
        _topic = topic,
        _topic1 = topic1,
        _topic2 = topic2,
        _topic3 = topic3,
        _topic4 = topic4,
        _topic5 = topic5,
        _topic6 = topic6,
        _topic7 = topic7,
        _topic8 = topic8,
        _currentState = state;

  //membuat instance
  void initializeMQTTClient() {
    _client = MqttServerClient(_host, _identifier);
    _client.port = 1883;
    _client.keepAlivePeriod = 20;
    _client.onDisconnected = onDisconnected;
    _client.secure = false;
    _client.logging(on: true);

    /// Add the successful connection callback
    _client.onConnected = onConnected;
    _client.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier)
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    _client.connectionMessage = connMess;
  }

  // Connect to the host
  // ignore: avoid_void_async
  void connect() async {
    assert(_client != null);
    try {
      print('EXAMPLE::Mosquitto start client connecting....');
      _currentState.setAppConnectionState(MQTTAppConnectionState.connecting);
      await _client.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    print('Disconnected');
    _client.disconnect();
  }

  void publish(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload);
  }

  void publish1(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client.publishMessage("application/2/device/f5da3b4ea3fb20f7/tx",
        MqttQos.exactlyOnce, builder.payload);
  }

  void publish2(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client.publishMessage("application/2/device/f5da3b4ea3fb20f7/tx",
        MqttQos.exactlyOnce, builder.payload);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (_client.connectionStatus.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    _currentState.setAppConnectionState(MQTTAppConnectionState.disconnected);
  }

  /// The successful connect callback
  void onConnected() {
    _currentState.setAppConnectionState(MQTTAppConnectionState.connected);
    print('EXAMPLE::Mosquitto client connected....');
    _client.subscribe(_topic, MqttQos.atLeastOnce);
    _client.subscribe(_topic1, MqttQos.atLeastOnce);
    _client.subscribe(_topic2, MqttQos.atLeastOnce);
    _client.subscribe(_topic3, MqttQos.atLeastOnce);
    _client.subscribe(_topic4, MqttQos.atLeastOnce);
    _client.subscribe(_topic5, MqttQos.atLeastOnce);
    _client.subscribe(_topic6, MqttQos.atLeastOnce);
    _client.subscribe(_topic7, MqttQos.atLeastOnce);
    _client.subscribe(_topic8, MqttQos.atLeastOnce);
    _client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if (c[0].topic == "node1/v1") {
        _currentState.setReceivedText(pt);
      } else if (c[0].topic == "node1/v2") {
        _currentState.setReceivedText1(pt);
      } else if (c[0].topic == "node1/v3") {
        _currentState.setReceivedText2(pt);
      } else if (c[0].topic == "node1/c1") {
        _currentState.setReceivedText3(pt);
      } else if (c[0].topic == "node1/c2") {
        _currentState.setReceivedText4(pt);
      } else if (c[0].topic == "node1/c3") {
        _currentState.setReceivedText5(pt);
      } else if (c[0].topic == "node1/notif") {
        _currentState.setReceivedText8(pt);
      }
      print(
          'Example::change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
  }
}
