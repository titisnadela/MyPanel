import 'package:flutter/material.dart';
import 'package:tes/code.dart';

class Manual extends StatefulWidget {
  @override
  _ManualState createState() => _ManualState();
}

class _ManualState extends State<Manual> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: Image(
                  image: AssetImage("assets/solarmanual.png"),
                  width: 300,
                  height: 300,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "  Select the end node to view!",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.green[500],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Code();
                  }));
                },
                child: Text("          Node 1          "),
                elevation: 5,
              ),
              RaisedButton(
                color: Colors.green[500],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Code();
                  }));
                },
                child: Text("          Node 2          "),
                elevation: 5,
              ),
              RaisedButton(
                color: Colors.green[500],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Code();
                  }));
                },
                child: Text("          Node 3          "),
                elevation: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
