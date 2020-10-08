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
      body: Container(
        color: Color(0xffc8e6c9),
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
    );
  }

  Widget _iconRegister() {
    return Image.asset(
      "assets/register.png",
      width: 150,
      height: 150,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16),
        ),
        Text(
          'Registration',
          style: TextStyle(color: Colors.black, fontSize: 16),
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
                color: Colors.white,
                width: 3,
              ),
            ),
            hintText: "name",
            hintStyle: TextStyle(color: Colors.grey),
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
                color: Colors.white,
                width: 3,
              ),
            ),
            hintText: "email",
            hintStyle: TextStyle(color: Colors.grey),
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
                color: Colors.white,
                width: 3,
              ),
            ),
            hintText: "password",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autofocus: false,
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 12),
        // ),
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
                padding: EdgeInsets.symmetric(vertical: 8),
                color: Colors.lightGreen,
                child: Text("Register"),
                onPressed: () {
                  daftar();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
        ),
        Text(
          'or',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        FlatButton(
          child: Text(
            'login',
            style: TextStyle(color: Colors.black),
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
          title: new Text('lengkapi pendaftaran'),
          content: new Text('lengkapi pendaftaran'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('Try again?'))
          ],
        );
      });
}
