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

  double _maxData = 10;
  double _maxData1 = 10;

  List _time = [];
  List _time1 = [];
  List _time2 = [];
  List _time3 = [];
  List _time4 = [];
  List _time5 = [];
  List _time6 = [];
  List _time7 = [];
  List _time8 = [];

  List<double> _dataList = [];
  List<double> _dataList1 = [];
  List<double> _dataList2 = [];
  List<double> _dataList3 = [];
  List<double> _dataList4 = [];
  List<double> _dataList5 = [];
  List<double> _dataList6 = [];
  List<double> _dataList7 = [];
  List<double> _dataList8 = [];
  List<double> _dataIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  double dataIndex;

  double _index = 1;
  List<FlSpot> _data = [FlSpot(0, 0)];

  double _index1 = 1;
  List<FlSpot> _data1 = [FlSpot(0, 0)];

  double _index2 = 1;
  List<FlSpot> _data2 = [FlSpot(0, 0)];

  double _index3 = 1;
  List<FlSpot> _data3 = [FlSpot(0, 0)];

  double _index4 = 1;
  List<FlSpot> _data4 = [FlSpot(0, 0)];

  double _index5 = 1;
  List<FlSpot> _data5 = [FlSpot(0, 0)];

  double _index6 = 1;
  List<FlSpot> _data6 = [FlSpot(0, 0)];

  double _index7 = 1;
  List<FlSpot> _data7 = [FlSpot(0, 0)];

  double _index8 = 1;
  List<FlSpot> _data8 = [FlSpot(0, 0)];

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

  void setReceivedText2(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time2.add(newDt);
    _dataList2.add(double.parse(text));
    if (_data2.length <= 10) {
      _data2.add(FlSpot(_index2, _dataList2[_index2.toInt() - 1]));
      _index2++;
    } else if (_data2.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList2.length - 10;
      _data2 = [FlSpot(0, _dataList2[fn - 1])];
      print("oke");
      print(_data2.length);
      int i;
      _time2.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data2.add(FlSpot(_dataIndex[i], _dataList2[fn]));
        fn++;
      }
      _index2 = 1;
    }
    notifyListeners();
  }

  void setReceivedText3(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time3.add(newDt);
    _dataList3.add(double.parse(text));
    if (_data3.length <= 10) {
      _data3.add(FlSpot(_index3, _dataList3[_index3.toInt() - 1]));
      _index3++;
    } else if (_data3.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList3.length - 10;
      _data3 = [FlSpot(0, _dataList3[fn - 1])];
      print("oke");
      print(_data3.length);
      int i;
      _time3.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data3.add(FlSpot(_dataIndex[i], _dataList3[fn]));
        fn++;
      }
      _index3 = 1;
    }
    notifyListeners();
  }

  void setReceivedText4(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time4.add(newDt);
    _dataList4.add(double.parse(text));
    if (_data4.length <= 10) {
      _data4.add(FlSpot(_index4, _dataList4[_index4.toInt() - 1]));
      _index4++;
    } else if (_data4.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList4.length - 10;
      _data4 = [FlSpot(0, _dataList4[fn - 1])];
      print("oke");
      print(_data4.length);
      int i;
      _time4.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data4.add(FlSpot(_dataIndex[i], _dataList4[fn]));
        fn++;
      }
      _index4 = 1;
    }
    notifyListeners();
  }

  void setReceivedText5(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time5.add(newDt);
    _dataList5.add(double.parse(text));
    if (_data5.length <= 10) {
      _data5.add(FlSpot(_index5, _dataList5[_index5.toInt() - 1]));
      _index5++;
    } else if (_data5.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList5.length - 10;
      _data5 = [FlSpot(0, _dataList5[fn - 1])];
      print("oke");
      print(_data5.length);
      int i;
      _time5.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data5.add(FlSpot(_dataIndex[i], _dataList5[fn]));
        fn++;
      }
      _index5 = 1;
    }
    notifyListeners();
  }

  void setReceivedText6(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time6.add(newDt);
    _dataList6.add(double.parse(text));
    if (_data6.length <= 10) {
      _data6.add(FlSpot(_index6, _dataList6[_index6.toInt() - 1]));
      _index6++;
    } else if (_data6.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList6.length - 10;
      _data6 = [FlSpot(0, _dataList6[fn - 1])];
      print("oke");
      print(_data6.length);
      int i;
      _time6.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data6.add(FlSpot(_dataIndex[i], _dataList6[fn]));
        fn++;
      }
      _index6 = 1;
    }
    notifyListeners();
  }

  void setReceivedText7(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time7.add(newDt);
    _dataList7.add(double.parse(text));
    if (_data7.length <= 10) {
      _data7.add(FlSpot(_index7, _dataList7[_index7.toInt() - 1]));
      _index7++;
    } else if (_data7.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList7.length - 10;
      _data7 = [FlSpot(0, _dataList7[fn - 1])];
      print("oke");
      print(_data7.length);
      int i;
      _time7.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data7.add(FlSpot(_dataIndex[i], _dataList7[fn]));
        fn++;
      }
      _index7 = 1;
    }
    notifyListeners();
  }

  void setReceivedText8(String text) {
    var dt = DateTime.now();
    var newDt = DateFormat.Hms().format(dt);
    _time8.add(newDt);
    _dataList8.add(double.parse(text));
    if (_data8.length <= 10) {
      _data8.add(FlSpot(_index8, _dataList8[_index8.toInt() - 1]));
      _index8++;
    } else if (_data8.length > 10) {
      //  _maxData = _data.length.toDouble() + 2;
      int fn = _dataList8.length - 10;
      _data8 = [FlSpot(0, _dataList8[fn - 1])];
      print("oke");
      print(_data8.length);
      int i;
      _time8.removeAt(0);
      for (i = 0; i < 10; i++) {
        _data8.add(FlSpot(_dataIndex[i], _dataList8[fn]));
        fn++;
      }
      _index8 = 1;
    }
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  List<FlSpot> get getData => _data;
  List<FlSpot> get getData1 => _data1;
  List<FlSpot> get getData2 => _data2;
  List<FlSpot> get getData3 => _data3;
  List<FlSpot> get getData4 => _data4;
  List<FlSpot> get getData5 => _data5;
  List<FlSpot> get getData6 => _data6;
  List<FlSpot> get getData7 => _data7;
  List<FlSpot> get getData8 => _data8;
  List get getTitles => _time;
  List get getTitles1 => _time1;
  double get maxData => _maxData;
  double get maxData1 => _maxData1;
  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
