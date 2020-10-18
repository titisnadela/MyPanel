import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

//model for mqtt connection and subscription
enum MQTTAppConnectionState { connected, disconnected, connecting }

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;

  // String _receivedText = '';
  // String _historyText = '';
  // String _receivedText1 = '';
  // String _historyText1 = '';
  // double _maxData = 10;
  // double _maxData1 = 10;
  // List _time = [];
  // List _time1 = [];
  // double _index = 1;
  // List<FlSpot> _data = [FlSpot(0, 10)];
  // List<FlSpot> _nomor = [FlSpot(0, 10)];
  // double _index1 = 1;
  // List<FlSpot> _data1 = [FlSpot(0, 10)];
  // List<FlSpot> _nomor1 = [FlSpot(0, 10)];

  String _receivedText = '';
  String _historyText = '';

  double _index = 1;
  List<FlSpot> _data = [FlSpot(0, 10)];
  double _maxData = 10;
  double _maxData1 = 10;

  List _time = [];
  List _time1 = [];

  List<double> _dataList = [];
  List<double> _dataList1 = [];
  List<double> _dataIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  double dataIndex;

  double _index1 = 1;
  List<FlSpot> _data1 = [FlSpot(0, 10)];

  // void setReceivedText(String text) {
  //   var dt = DateTime.now();
  //   var newDt = DateFormat.Hms().format(dt);
  //   _time.add(newDt);
  //   _data.add(FlSpot(_index, double.parse(text)));
  //   _receivedText = text;
  //   _historyText = _historyText + '\n' + _receivedText;
  //   if (_data.length >= 10) {
  //     _maxData = _data.length.toDouble() + 2;
  //   }
  //   _index++;
  //   notifyListeners(); //BERFUNGSI UNTUK MEMBERITAHUKAN BAHWA ADA DATA BARU SEHINGGA WIDGET AKAN DI RE-RENDER
  // }

  // void setReceivedText1(String text) {
  //   var dt1 = DateTime.now();
  //   var newDt1 = DateFormat.Hms().format(dt1);
  //   _time1.add(newDt1);
  //   _data1.add(FlSpot(_index1, double.parse(text)));
  //   _receivedText1 = text;
  //   _historyText1 = _historyText1 + '\n' + _receivedText1;
  //   if (_data1.length >= 10) {
  //     _maxData1 = _data1.length.toDouble() + 2;
  //   }
  //   _index1++;
  //   notifyListeners();
  // }

  void setReceivedText(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time.add(newDt);
    _dataList.add(double.parse(text));
    if (_data.length <= 10) {
      _data.add(FlSpot(_index, _dataList[_index.toInt() - 1]));
      _index++;
    } else if (_data.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList.length - 10;
      _data = [FlSpot(0, _dataList[fn - 1])];
      print("oke");
      print(_data.length);
      int i;
      _time.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data.add(FlSpot(_dataIndex[i], _dataList[fn]));
        fn++;
      }
      _index = 1;
    }
    notifyListeners();
  }

  void setReceivedText1(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time1.add(newDt);

    // _receivedText = text;
    // _historyText = _historyText + '\n' + _receivedText;
    // if (_data1.length >= 10) {
    //   _maxData1 = _data1.length.toDouble() + 2;
    // }
    // _index1++;
    _dataList1.add(double.parse(text));
    if (_data1.length <= 10) {
      _data1.add(FlSpot(_index1, _dataList1[_index1.toInt() - 1]));
      _index1++;
    } else if (_data1.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList1.length - 10;
      _data1 = [FlSpot(0, _dataList1[fn - 1])];
      print("oke");
      print(_data1.length);
      int i;
      _time1.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data1.add(FlSpot(_dataIndex[i], _dataList1[fn]));
        fn++;
      }
      _index1 = 1;
    }
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

//   List<FlSpot> get getData => _data;
//   List<FlSpot> get getData1 => _data1;
//   List<FlSpot> get getNomor => _nomor;
//   List<FlSpot> get getNomor1 => _nomor1;
//   List get getTitles => _time;
//   List get getTitles1 => _time1;
//   double get maxData => _maxData;
//   double get maxData1 => _maxData1;

//   String get getReceivedText => _receivedText;
//   String get getHistoryText => _historyText;
//   MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

//   // String get getReceivedText1 => _receivedText1;
//   // String get getHistoryText1 => _historyText1;
//   // MQTTAppConnectionState get getAppConnectionState1 => _appConnectionState;
// }

  List<FlSpot> get getData => _data;
  List<FlSpot> get getData1 => _data1;
  List get getTitles => _time;
  List get getTitles1 => _time1;
  double get maxData => _maxData;
  double get maxData1 => _maxData1;
  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
