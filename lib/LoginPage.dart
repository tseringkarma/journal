import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Future.value(false);
      },
      child: Scaffold(
          body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 135,
                  child: Image.asset('assets/starting.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: Color(0xFF6D6DFB), fontFamily: 'login'),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color(0xFF6D6DFB))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 13.0, right: 16.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color(0xFF6D6DFB), fontFamily: 'login'),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color(0xFF6D6DFB))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Color(0xFF6D6DFB),
                    minWidth: 250,
                    height: 60.0,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'login'),
                    ),
                    onPressed: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          fontFamily: 'login',
                          color: Color(0xFF6D6DFB),
                          fontSize: 16.0),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                          
                        
                        ),
                        SizedBox(
                          width: 16.0,
                        ) ,
                        Text('OR', style: TextStyle(color: Colors.grey),),
                         SizedBox(
                          width: 16.0,
                        ) ,
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
            ],
          )
        ],
      )),
    );
  }
}
