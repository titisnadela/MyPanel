import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tes/about.dart';
import 'package:tes/login.dart';
import 'package:tes/mqtt/state/MQTTAppState.dart';
import 'package:tes/mqtt2/state2/MQTTAppState2.dart';
import 'package:tes/mqtt3/state3/MQTTAppState3.dart';
import 'package:tes/topolgi.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:tes/widgets/mqttView.dart';
import 'package:tes/widgets2/mqttView2.dart';
import 'package:tes/widgets3/mqttView3.dart';

class Home extends StatefulWidget {
  final String name;
  final String email;
  Home({this.name, this.email});
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
          backgroundColor: Color(0xFF558B2F),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF558B2F)),
                currentAccountPicture:
                    Icon(Icons.account_circle, size: 80, color: Colors.white),
                accountName: Text(widget.name),
                accountEmail: Text(widget.email),
              ),
              ListTile(
                leading: Icon(Icons.scatter_plot),
                title: Text('Topologi'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Topologi();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return About();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainPage();
                  }));
                },
              )
            ],
          ),
        ),
        body: Stack(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                          return ChangeNotifierProvider<MQTTAppState>(
                            create: (_) => MQTTAppState(),
                            child: MQTTView(),
                          );
                        }));

                        break;
                      case "node 2":
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangeNotifierProvider<MQTTAppState2>(
                            create: (_) => MQTTAppState2(),
                            child: MQTTView2(),
                          );
                          // return Code2();
                        }));

                        break;
                      case "node 3":
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangeNotifierProvider<MQTTAppState3>(
                            create: (_) => MQTTAppState3(),
                            child: MQTTView3(),
                          );
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
        ]));
  }
}
