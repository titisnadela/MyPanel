import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart2 extends StatelessWidget {
  final List<FlSpot> data;
  final List<FlSpot> data1;
  // final List<FlSpot> nomor;
  // final List<FlSpot> nomor1;
  final List titles;
  final List titles1;
  final double maxData;
  final double maxData1;

  Chart2({
    this.data,
    this.data1,
    // this.nomor,
    // this.nomor1,
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
      children: <Widget>[
        Container(
          child: AspectRatio(
            aspectRatio: 1.2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(0, 0)),
                  gradient: LinearGradient(colors: [
                    Color(0xffc8e6c9),
                    Color(0xffe8f5e9),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  color: Color(0xff000000)),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 30, bottom: 30, right: 30),
                  // padding: const EdgeInsets.only(
                  //     right: 18, left: 12, top: 24, bottom: 12),
                  child: LineChart(
                    mainData(),
                  )),
            ),
          ),
        ),
        // Container(
        //   child: AspectRatio(
        //     aspectRatio: 1.2,
        //     child: Container(
        //       decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.elliptical(0, 0)),
        //           gradient: LinearGradient(colors: [
        //             Color(0xffc8e6c9),
        //             Color(0xffe8f5e9),
        //           ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        //           color: Color(0xff000000)),
        //       child: Padding(
        //         padding:
        //             EdgeInsets.only(left: 10, top: 30, bottom: 30, right: 30),
        //         // padding: const EdgeInsets.only(
        //         //     right: 18, left: 12, top: 24, bottom: 12),
        //         child: LineChart(
        //           mainData1(),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
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
          textStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8),
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
      maxX: maxData,
      minY: 0,
      maxY: 70,
      lineBarsData: linesBarData1(),
    );
  }

  // ignore: missing_return
  List<LineChartBarData> linesBarData1() {
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData1 = LineChartBarData(
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
            colors: gradientColors
                .map((color) => color.withOpacity(0.5))
                .toList()));
    // ignore: unused_local_variable
    final LineChartBarData lineChartBarData2 = LineChartBarData(
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
            colors: gradientColors
                .map((color) => color.withOpacity(0.2))
                .toList()));
    return [lineChartBarData1, lineChartBarData2];
  }

//   LineChartData mainData1() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 0.5,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 0.5,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           interval: 5,
//           rotateAngle: 60,
//           showTitles: true,
//           reservedSize: 30,
//           textStyle: const TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8),
//           getTitles: (value) {
//             print('test');
//             if (value > 0) {
//               return titles1[value.toInt() - 1].toString();
//             } else {
//               return "";
//             }
//           },
//           margin: 0,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 7,
//           ),
//           getTitles: (value) {
//             return value.toString();
//           },
//           reservedSize: 30,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: true,
//           border: Border.all(color: const Color(0xff37434d), width: 1)),
//       minX: 0,
//       maxX: maxData1,
//       minY: 0,
//       maxY: 70,
//       lineBarsData: linesBarData2(),
//     );
//   }

//   // ignore: missing_return
//   List<LineChartBarData> linesBarData2() {
//     // ignore: unused_local_variable
//     final LineChartBarData lineChartBarData3 = LineChartBarData(
//         spots: data,
//         isCurved: true,
//         colors: gradientColors,
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//             show: true,
//             colors: gradientColors
//                 .map((color) => color.withOpacity(0.5))
//                 .toList()));
//     // ignore: unused_local_variable
//     final LineChartBarData lineChartBarData4 = LineChartBarData(
//         spots: data1,
//         isCurved: true,
//         colors: gradientColors,
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//             show: true,
//             colors: gradientColors
//                 .map((color) => color.withOpacity(0.2))
//                 .toList()));
//     return [lineChartBarData3, lineChartBarData4];
//   }
}
