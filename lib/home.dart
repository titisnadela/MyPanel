import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tes/code.dart';
import 'package:tes/code3.dart';
import 'package:tes/manual.dart';
import 'package:tes/setting.dart';

import 'code2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: Image(
                  image: AssetImage("assets/manual1.png"),
                  width: 64,
                  height: 100,
                ),
              ),
              RaisedButton(
                color: Colors.lightGreen[700],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Manual();
                  }));
                },
                child: Text('Manual'),
                elevation: 5,
              ),
            ],
          ),
          Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: Image(
                image: AssetImage(
                  'assets/qrcode1.png',
                ),
                width: 100,
                height: 100,
              ),
            ),
            RaisedButton(
              color: Colors.lightGreen[700],
              onPressed: () async {
                try {
                  String barcode = await BarcodeScanner.scan();
                  setState(() {
                    this.barcode = barcode;
                    switch (barcode) {
                      case "node 1":
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Code();
                        }));

                        break;
                      case "node 2":
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Code2();
                        }));

                        break;
                      case "node 3":
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Code3();
                        }));
                        break;
                      default:
                    }
                  });
                } on PlatformException catch (error) {
                  if (error.code == BarcodeScanner.CameraAccessDenied) {
                    setState(() {
                      this.barcode = 'izin kamera tidak diizinkan oleh user';
                    });
                  } else {
                    setState(() {
                      this.barcode = 'Error: $error';
                    });
                  }
                }
              },
              child: Text("Scan"),
              elevation: 5,
            ),
          ]),
          Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: Image(
                image: AssetImage(
                  'assets/setting.png',
                ),
                width: 64,
                height: 100,
              ),
            ),
            RaisedButton(
              color: Colors.lightGreen[700],
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Setting();
                }));
              },
              child: Text("Setting"),
              elevation: 5,
            ),
          ])
        ],
      ),
    );
  }
}
