import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

enum MQTTAppConnectionState3 { connected, disconnected, connecting }

class MQTTAppState3 with ChangeNotifier {
  // ignore: unused_field
  MQTTAppConnectionState3 _appConnectionState3 =
      MQTTAppConnectionState3.disconnected;

  void setAppConnectionState3(MQTTAppConnectionState3 connecting) {}

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

  void setReceivedTextc(String text) {
    var dat = DateTime.now();
    var newDat = DateFormat.Hms().format(dat);
    _time.add(newDat);
    _data.add(FlSpot(_index, double.parse(text)));
    _receivedText = text;
    _historyText = _historyText + '\n' + _receivedText;
    if (_data.length >= 10) {
      _maxData = _data.length.toDouble() + 2;
    }
    _index++;
    notifyListeners();
  }

  void setReceivedTextc1(String text) {
    var dat1 = DateTime.now();
    var newDat1 = DateFormat.Hms().format(dat1);
    _time1.add(newDat1);
    _data1.add(FlSpot(_index1, double.parse(text)));
    _receivedText1 = text;
    _historyText1 = _historyText1 + '\n' + _receivedText1;
    if (_data1.length >= 10) {
      _maxData1 = _data1.length.toDouble() + 2;
    }
    _index1++;
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState3 state2) {
    _appConnectionState3 = state2;
    notifyListeners();
  }

  List<FlSpot> get getData => _data;
  List<FlSpot> get getData1 => _data1;
// List<FlSpot> get getNomor => _nomor;
// List<FlSpot> get getNomor1 => _nomor1;
  List get getTitles => _time;
  List get getTitles1 => _time1;
  double get maxData => _maxData;
  double get maxData1 => _maxData1;

  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState3 get getAppConnectionState3 => _appConnectionState3;
}
