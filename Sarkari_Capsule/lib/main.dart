import 'package:flutter/material.dart';

import 'package:sarkari_capsule/splash/splashscreen.dart';
import 'package:sarkari_capsule/homepage/homepage.dart';
import 'package:sarkari_capsule/searchpage/searchpage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.blueAccent,

      ),

      home: SplashScreen(),

      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => SarkariCapsule(),
        '/Search': (BuildContext context) => SearchPage(),
      },

    );
  }
}
