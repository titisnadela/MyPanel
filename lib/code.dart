import 'package:flutter/material.dart';
// tes/mqtt/state/MQTTAppState.dart
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:tes/widgets/mqttView.dart';
import 'package:provider/provider.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF1F8E9),
        appBar: AppBar(
          title: Text(
            "MyPanel",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xFF558B2F),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 411,
                  height: 50,
                  color: Color(0xFFF1F8E9),
                  alignment: FractionalOffset(0.025, 0.5),
                  child: Text(
                    "Node 1",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //         width: 402,
            //         height: 20,
            //         color: Color(0xff558b2f),
            //         alignment: FractionalOffset(0.5, 0.5),
            //         child: Text(
            //           "Current",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         ))
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Panel",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Battery",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Appliance",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       width: 402,
            //       height: 20,
            //       color: Color(0xff558b2f),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Text(
            //         "Voltage",
            //         style: TextStyle(
            //             color: Colors.white, fontWeight: FontWeight.bold),
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Panel",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Battery",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 130,
            //       height: 150,
            //       color: Colors.lightGreen,
            //       margin: EdgeInsets.all(3),
            //       alignment: FractionalOffset(0.5, 0.5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Appliance",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           Text(
            //             "0.0",
            //             style: TextStyle(fontSize: 100, color: Colors.white),
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     RaisedButton(
            //       color: Colors.yellow,
            //       onPressed: () {},
            //       child: Text(
            //           "                         ON                              "),
            //     ),
            //     RaisedButton(
            //       color: Colors.yellow,
            //       onPressed: () {},
            //       child: Text(
            //           "                              OFF                        "),
            //     )
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green[800],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChangeNotifierProvider<MQTTAppState>(
                        create: (_) => MQTTAppState(),
                        child: MQTTView(),
                      );
                    }));
                  },
                  child: Text(
                    "Contoh pub/sub",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
