import 'package:flutter/material.dart';
import 'package:tomorrow/animate/guillotine.dart';
import 'splashscreen/splash.dart';
import 'package:tomorrow/Search/searchpage.dart';
import 'package:tomorrow/jsongenerator/tripData.dart';
import 'package:tomorrow/jsongenerator/personData.dart';
import 'package:tomorrow/profile/profilesettings.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tripify',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
      routes: <String,WidgetBuilder>{
        "/home" :(BuildContext context)  =>  Guillotine(),
        "/Search" :(BuildContext context)  =>  SearchPage(),
        "/Trips" :(BuildContext context)  =>  Trips(),
        "/Profile" :(BuildContext context)  =>  Profile(),
        "/Settings" :(BuildContext context)  =>  EditProfile(),
      },
    );
  }
}


Map<int, Color> color ={
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),};

MaterialColor colorCustom = MaterialColor(0x6A1B9A, color);