import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Offline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: ()async{
          Future.value(false);
        },
        child:  Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/offline.png'))),
          ),
        ],
      ),
      ),
    );
  }
}
