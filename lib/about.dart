import 'package:flutter/material.dart';

class About extends StatelessWidget {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About'),
          backgroundColor: Color(0xFF558B2F),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              right: -getSmallDiameter(context) / 3,
              top: -getBigDiameter(context) / 2,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
              ),
            ),
            Positioned(
              left: -getSmallDiameter(context) / 4,
              top: -getSmallDiameter(context) / 2,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
              ),
            ),
            Positioned(
              left: -getBigDiameter(context) / 4,
              bottom: -getBigDiameter(context) / 4,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
              ),
            ),
            Positioned(
              right: -getBigDiameter(context) / 2,
              bottom: -getBigDiameter(context) / 2,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
              ),
            ),
            Center(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 250),
                ),
                Text(
                  "MyPanel Apps",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 3, bottom: 3)),
                Text('Version 1.0'),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                Image(
                  image: AssetImage('assets/logofix.png'),
                  width: 170,
                  height: 170,
                ),
              ]),
            )
          ],
        ));
  }
}
