import 'package:flutter/material.dart';
import 'package:tes/current.dart';
import 'package:tes/voltage.dart';

class Identity extends StatefulWidget {
  @override
  _IdentityState createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
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
                alignment: FractionalOffset(0.5, 0.5),
                child: Text(
                  "Identity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 402,
                  height: 60,
                  color: Color(0xff558b2f),
                  margin: EdgeInsets.all(3),
                  alignment: FractionalOffset(0.1, 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Application Session Key : ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "4D 57 D9 18 06 45 7D 6F 3A C1 DB 29 71 4E 51 1C",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 402,
                  height: 60,
                  color: Color(0xff558b2f),
                  margin: EdgeInsets.all(3),
                  alignment: FractionalOffset(0.1, 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Network Session Key : ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "4D 57 D9 18 06 45 7D 6F 3A C1 DB 29 71 4E 51 1C",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 402,
                  height: 60,
                  color: Color(0xff558b2f),
                  margin: EdgeInsets.all(3),
                  alignment: FractionalOffset(0.025, 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Device Address : ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "01 59 07 4e",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Current();
                  }));
                },
                child: Text("Current"),
                elevation: 5,
              ),
              RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Voltage();
                  }));
                },
                child: Text("Volatge"),
                elevation: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
