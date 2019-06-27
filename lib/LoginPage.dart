import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            'assets/logo.jpg',
            height: 220,
            width: 450,
          ),
          Text(
            'Journal',
            style: TextStyle(fontSize: 60.0, fontFamily: 'Akey'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 40.0),
                  child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        child: Image.asset('assets/googleicon.png'),
                        onTap: () {
                          print('I am pressed');
                        },
                      ))),
              Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 70.0, right: 40.0),
                  child: CircleAvatar(
                      radius: 53.0,
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        child: Image.asset('assets/facebookicon.png'),
                        onTap: () {
                          print('I am facebook');
                        },
                      ))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.0, top: 20.0, left: 3.0),
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent,
              child: GestureDetector(
                child: Image.asset('assets/phonelogo.png',),
                onTap: () {
                  print('I am phone ');
                },
              )),
          )
        ],
      ),
    ),
    );
  }
}
