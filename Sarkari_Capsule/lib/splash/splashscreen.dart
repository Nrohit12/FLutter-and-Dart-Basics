import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), ()=>
      Navigator.of(context).pushReplacementNamed("/HomePage")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assetimage/logoimage.jpg'),
                  maxRadius: 35.0,
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 1.0,
                ),
              ],
            ),
          ],
        ),
    );
  }
}
