import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo.jpg',
            height: 200,
            width: 450,
          ),
          Text(
            'Journal',
            style: TextStyle(fontSize: 55.0, fontFamily: 'Akey'),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 50.0),
              child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 50.0,
              child: Center(
                child:  IconButton(
                    icon: Icon(EvaIcons.googleOutline, color: Colors.white, size: 50.0,),
                  ),
              )
            ),
            )
            
          ],
          ),
        ],
      ),
    );
  }
}
