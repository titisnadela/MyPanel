//import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Chart2 extends StatelessWidget {
  final List<FlSpot> data;
  final List<FlSpot> data1;
  final List<FlSpot> data2;
  final List<FlSpot> data3;
  final List<FlSpot> data4;
  final List<FlSpot> data5;
  final List<FlSpot> data6;
  final List<FlSpot> data7;
  final List<FlSpot> data8;
  final List titles;
  final List titles1;
  final double maxData;
  final double maxData1;
  final LineTouchData lineTouchData;

  Chart2({
    this.data,
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
    this.data7,
    this.data8,
    this.titles,
    this.titles1,
    this.maxData,
    this.maxData1,
    this.lineTouchData,
  });

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
          top: 5,
        )),
        Column(children: <Widget>[
          Text(
            "Voltage",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5,
          )),
          AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(0, 0)),
                  gradient: LinearGradient(colors: [
                    //Color(0x000000000)
                    Color(0xFFF1F8E9),
                    Color(0xFFF1F8E9),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  color: Color(0xff000000)),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 20),
                  // padding: const EdgeInsets.only(
                  //     right: 18, left: 12, top: 24, bottom: 12),
                  child: LineChart(
                    _mainData(),
                  )),
            ),
          ),
        ]),
        Column(children: <Widget>[
          Text(
            "Current",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(0, 0)),
                  gradient: LinearGradient(colors: [
                    Color(0xFFF1F8E9),
                    Color(0xFFF1F8E9),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  color: Color(0xff000000)),
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 5, bottom: 0, right: 30),
                // padding: const EdgeInsets.only(
                //     right: 18, left: 12, top: 24, bottom: 12),
                child: LineChart(
                  _mainData1(),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  LineChartData _mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.withOpacity(0.8))),
      //clipToBorder: true,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: 2,
          rotateAngle: 0,
          showTitles: true,
          reservedSize: 50,
          textStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
          getTitles: (value) {
            print('test');
            if (value >= 0) {
              return titles[value.toInt()].toString();
            } else {
              return "";
            }
            //return titles[value.toInt() - 1].toString;
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            return value.toString();
          },
          reservedSize: 30,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: maxData,
      minY: 0,
      maxY: 20,
      lineBarsData: linesBarData1(),
    );
  }

  // ignore: missing_return
  List<LineChartBarData> linesBarData1() {
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData1 = LineChartBarData(
        spots: data,
        isCurved: true,
        colors: [Colors.blue],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.9))
                .toList()));
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData2 = LineChartBarData(
        spots: data1,
        isCurved: true,
        colors: [Colors.yellow],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.2))
                .toList()));
    final LineChartBarData lineChartBarData3 = LineChartBarData(
        spots: data2,
        isCurved: true,
        colors: [Colors.purple],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.5))
                .toList()));

    return [lineChartBarData1, lineChartBarData2, lineChartBarData3];
  }

  LineChartData _mainData1() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: 2,
          rotateAngle: 0,
          showTitles: true,
          reservedSize: 50,
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
          getTitles: (value) {
            print('test');
            if (value >= 0) {
              return titles1[value.toInt()].toString();
            } else {
              return "";
            }
            //return titles1[value.toInt() - 1].toString;
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            return value.toString().substring(0, 3);
          },
          reservedSize: 20,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: maxData1,
      minY: 0,
      maxY: 3,
      lineBarsData: linesBarData2(),
    );
  }

  // ignore: missing_return
  List<LineChartBarData> linesBarData2() {
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData3 = LineChartBarData(
        spots: data3,
        isCurved: false,
        colors: [Colors.blue],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.5))
                .toList()));
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData4 = LineChartBarData(
        spots: data4,
        isCurved: true,
        colors: [Colors.yellow],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.2))
                .toList()));
    final LineChartBarData lineChartBarData5 = LineChartBarData(
        spots: data5,
        isCurved: true,
        colors: [Colors.purple],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map((color) => color.withOpacity(0.5))
                .toList()));
    return [lineChartBarData3, lineChartBarData4, lineChartBarData5];
  }
}
