import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './UserPage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> logInWithGoogle() async {
   

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseUser user = await _auth.signInWithCredential(credential);
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

    if (user.uid == currentUser.uid) {
      Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) {
        return UserPage();
      }));
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {


    initiateFacebookLogin() async {
var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
     switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print(" Facebook Error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print(" Facebook CancelledByUser");

        break;
      case FacebookLoginStatus.loggedIn:
      Navigator.push(context, MaterialPageRoute(
        builder: (_){
          return UserPage();
        }
      ));
        print(" Facebook LoggedIn");
        break;
    }
    }
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
                  child: Hero(
                    tag: 'startingImage',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 130,
                      child: Image.asset('assets/starting.png'),
                    ),
                  )),
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
                  padding: EdgeInsets.only(top: 20.0),
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
                padding:
                    const EdgeInsets.only(top: 16.0, right: 30.0, left: 30.0),
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
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 25.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              logInWithGoogle();
                            },
                            child: Image.asset(
                              'assets/google.png',
                              color: Colors.white,
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 20.0,
                    ),
                    CircleAvatar(
                        backgroundColor: Color(0xFF3C5A9A),
                        radius: 25.0,
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                initiateFacebookLogin();
                              },
                              child: Image.asset(
                                'assets/facebook.png',
                                color: Colors.white,
                              ),
                            ))),
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
