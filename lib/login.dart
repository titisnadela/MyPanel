import 'dart:async';
//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes/register.dart';

//import 'home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

// enum LoginStatus { notSignIn, signIn }

class _MainPageState extends State<MainPage> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  //String msg = '';

  // ignore: missing_return
  Future<List> _login() async {
    final response =
        await http.post("http://192.168.43.229:9000/api/login", body: {
      "email": email.text,
      "password": password.text,
    });

    // Future<List> _register() async {
    //   final response =
    //       await http.post("http://192.168.43.229:/register", body: {
    //         "Nama Lengkap" :
    //         "username" :
    //         "email" :
    //         "password" :
    //       });
    //}
    // print(response.statusCode);
    if (response.statusCode != 200) {
      setState(() {
        _showAlertDialog(context);
      });
    } else {
      Navigator.pushReplacementNamed(context, '/Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getBigDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFF1F8E9), Color(0xFF9CCC65)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getSmallDiameter(context) / 4,
            top: -getSmallDiameter(context) / 4,
            child: Container(
              child: Center(
                child: Text(
                  "MyPanel",
                  style: TextStyle(fontSize: 30, color: Color(0xFF303030)),
                ),
              ),
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    //Color(0xFFFFF59D),
                    Color(0xFFAED581),
                    Color(0xFF558B2F)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          // Positioned(
          //   left: -getBigDiameter(context) / 4,
          //   bottom: -getBigDiameter(context) / 4,
          //   child: Container(
          //     width: getBigDiameter(context),
          //     height: getBigDiameter(context),
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
          //   ),
          // ),
          // Positioned(
          //   right: -getBigDiameter(context) / 2,
          //   bottom: -getBigDiameter(context) / 2,
          //   child: Container(
          //     width: getBigDiameter(context),
          //     height: getBigDiameter(context),
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
          //   ),
          // ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Color(0xFF33691E),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF33691E))),
                              labelText: "Email ",
                              labelStyle: TextStyle(color: Color(0xFF33691E))),
                        ),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Color(0xFF33691E),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF33691E))),
                              labelText: "Password: ",
                              labelStyle: TextStyle(color: Color(0xFF33691E))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                          color: Colors.lightGreen[700],
                          child: Text("Login"),
                          onPressed: () {
                            _login();
                          },
                          elevation: 5,
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   msg,
                  //   style: TextStyle(fontSize: 20, color: Colors.red),
                  // ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                        child: Text(
                          "FORGOT PASSWORD",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 0, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // SizedBox(
                        //     width: MediaQuery.of(context).size.width * 0.5,
                        //     height: 40,
                        //     child: Container(
                        //       child: Material(
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: Color(0xff558b2f),
                        //         child: InkWell(
                        //           borderRadius: BorderRadius.circular(20),
                        //           splashColor: Colors.blueGrey,
                        //           child: Center(
                        //               // child: Text(
                        //               //   "SIGN IN",
                        //               //   style: TextStyle(
                        //               //       color: Colors.black,
                        //               //       fontWeight: FontWeight.w700),
                        //               // ),
                        //               ),
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           gradient: LinearGradient(
                        //               colors: [
                        //                 Color(0xFFF1F8E9),
                        //                 Color(0xFF9CCC65)
                        //               ],
                        //               begin: Alignment.topCenter,
                        //               end: Alignment.bottomCenter)),
                        //     ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "DON'T HAVE AN ACCOUNT? ",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              child: Text("sign up"),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Register();
                                }));
                              },
                              elevation: 5,
                            )
                          ],
                        ),
                      )
                      // Text(
                      //   "SIGN UP ",
                      //   style: TextStyle(
                      //       fontSize: 11,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w700),
                      // )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Wrong email or password'),
          content: new Text('Please enter correct email or password'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('Try again?'))
          ],
        );
      });
}
