import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<FlSpot> data;
  final List<FlSpot> data1;
  final List titles;
  final List titles1;
  final double maxData;
  final double maxData1;

  Chart({
    this.data,
    this.data1,
    this.titles,
    this.titles1,
    this.maxData,
    this.maxData1,
  });

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(0, 0),
                ),
                color: Color(0xff232d37)),
            child: Padding(
                padding: const EdgeInsets.only(
                    right: 18, left: 12, top: 24, bottom: 12),
                child: LineChart(
                  mainData(),
                )),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.7,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(0, 0),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18, left: 12, top: 24, bottom: 12),
              child: LineChart(
                mainData1(),
              ),
            ),
          ),
        )
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
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
          interval: 5,
          rotateAngle: 60,
          showTitles: true,
          reservedSize: 50,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 5),
          getTitles: (value) {
            print('test');
            if (value > 0) {
              return titles[value.toInt() - 1].toString();
            } else {
              return "";
            }
          },
          margin: 0,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 7,
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
      maxY: 70,
      lineBarsData: [
        LineChartBarData(
          spots: data,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.2)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData1() {
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
          interval: 5,
          rotateAngle: 60,
          showTitles: true,
          reservedSize: 30,
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 5),
          getTitles: (value) {
            print('test');
            if (value > 0) {
              return titles1[value.toInt() - 1].toString();
            } else {
              return "";
            }
          },
          margin: 01,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 7,
          ),
          getTitles: (value) {
            return value.toString();
          },
          reservedSize: 30,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: maxData1,
      minY: 0,
      maxY: 70,
      lineBarsData: [
        LineChartBarData(
          spots: data1,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.2)).toList(),
          ),
        ),
      ],
    );
  }
}
