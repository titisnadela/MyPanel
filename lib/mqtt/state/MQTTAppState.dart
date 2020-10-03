import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

//model for mqtt connection and subscription
enum MQTTAppConnectionState { connected, disconnected, connecting }

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;

  String _receivedText = '';
  String _historyText = '';

  String _receivedText1 = '';
  String _historyText1 = '';

  double _maxData = 10;
  double _maxData1 = 10;

  List _time = [];
  List _time1 = [];

  double _index = 1;
  List<FlSpot> _data = [FlSpot(0, 10)];

  double _index1 = 1;
  List<FlSpot> _data1 = [FlSpot(0, 10)];

  void setReceivedText(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time.add(newDt);
    _data.add(FlSpot(_index, double.parse(text)));
    _receivedText = text;
    _historyText = _historyText + '\n' + _receivedText;
    if (_data.length >= 10) {
      _maxData = _data.length.toDouble() + 2;
    }
    _index++;
    notifyListeners(); //BERFUNGSI UNTUK MEMBERITAHUKAN BAHWA ADA DATA BARU SEHINGGA WIDGET AKAN DI RE-RENDER
  }

  void setReceivedText1(String text) {
    var dt1 = DateTime.now();
    var newDt1 = DateFormat.Hms().format(dt1);
    _time1.add(newDt1);
    _data1.add(FlSpot(_index1, double.parse(text)));
    _receivedText1 = text;
    _historyText1 = _historyText1 + '\n' + _receivedText1;
    if (_data1.length >= 10) {
      _maxData1 = _data1.length.toDouble() + 2;
    }
    _index1++;
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  List<FlSpot> get getData => _data;
  List<FlSpot> get getData1 => _data1;
  List get getTitles => _time;
  List get getTitles1 => _time1;
  double get maxData => _maxData;
  double get maxData1 => _maxData1;

  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

  String get getReceivedText1 => _receivedText1;
  String get getHistoryText1 => _historyText1;
  MQTTAppConnectionState get getAppConnectionState1 => _appConnectionState;
}
