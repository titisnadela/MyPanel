//import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:tes/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();

  // ignore: missing_return
  Future<List> daftar() async {
    final response = await http.post("http://192.168.43.229:9000/api/register",
        body: {
          "email": email.text,
          "name": name.text,
          "password": password.text
        });
    //print(response.statusCode);
    if (response.statusCode != 201) {
      setState(() {
        _showAlertDialog(context);
      });
    } else {
      Navigator.pushReplacementNamed(context, '/MainPage');
    }
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getBigDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFE8F5E9)),
            ),
          ),
          Positioned(
            left: -getSmallDiameter(context) / 4,
            top: -getSmallDiameter(context) / 4,
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
          Container(
            color: Colors.white10,
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      _iconRegister(),
                      _titleDescription(),
                      _textField(),
                      _buildButton(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Widget _iconRegister() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50)),
          Image.asset(
            "assets/logofix.png",
            width: 100,
            height: 100,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10))
        ]);
  }

  Widget _titleDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Registration',
          style: TextStyle(
              color: Colors.green[900],
              fontSize: 25,
              fontFamily: "times-new-roman",
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12),
        ),
        TextFormField(
          controller: name,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 3,
              ),
            ),
            hintText: "Name",
            hintStyle: TextStyle(color: Colors.green),
          ),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
        ),
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 3,
              ),
            ),
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.green),
          ),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
        ),
        TextFormField(
          controller: password,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 3,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.green),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autofocus: false,
        ),

        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        // TextFormField(
        //   decoration: const InputDecoration(
        //       border: UnderlineInputBorder(),
        //       enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(
        //         color: Colors.grey,
        //         width: 1.5,
        //       )),
        //       focusedBorder: UnderlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Colors.white,
        //           width: 3,
        //         ),
        //       ),
        //       hintText: "confirm password",
        //       hintStyle: TextStyle(color: Colors.grey)),
        //   style: TextStyle(color: Colors.black),
        //   obscureText: true,
        //   autofocus: false,
        // )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16),
        ),
        Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                //padding: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                color: Colors.lightGreen[700],
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  daftar();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
        ),
        Text(
          'or',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
        ),
        RaisedButton(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          color: Colors.lightGreen[700],
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Form Registration'),
          content: new Text('Please fill in the registration form correctly!'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('Try again?'))
          ],
        );
      });
}
