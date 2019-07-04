import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:journal/Offline.dart';
import 'dart:async';
import './LoginPage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gradient_text/gradient_text.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Home> {
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    connectivity = Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        Timer(Duration(seconds: 6), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
        });
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Offline()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
      padding: EdgeInsets.only(top: 90.0),
      child: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            
            Hero(
              tag: 'startingImage',
              child: Image.asset('assets/starting.gif'),
            ),
            
            Positioned(
              top: 290.0,
              left: 25.0,
              child: GradientText(
                "Journal",
                gradient: (LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.pink])),
                style: TextStyle(fontSize: 65.0, fontFamily: 'Akey'),
              ),
            ),
            Positioned(
              top: 370,
              left: 70.0,
              child: Text(
                'Write & save your daily journals \n          online with Google A+ \n                       security',
                style: TextStyle(fontSize: 17.0, fontFamily: 'normal'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
