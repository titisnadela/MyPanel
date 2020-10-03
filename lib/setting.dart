import 'package:flutter/material.dart';
//import 'package:tes/home.dart';
import 'package:tes/login.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xFF558B2F),
      ),
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Image(
                            image: AssetImage('assets/user.png'),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Container(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(0, 35, 50, 20),
                          child: Text(
                            'Titis Nadela',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
              child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(10, 120, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "titisnadela",
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "********"),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "nana@gmail.com"),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Align(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                )
              ],
            ),
          ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     RaisedButton(
          //       onPressed: () {},
          //       child: Text("About"),
          //     ),
          //     RaisedButton(
          //       onPressed: () {},
          //       child: Text("Sign Out"),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
