import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

//  static void goToLogin( context) {
//    Navigator.pushNamed(context, "/login");
//  }
//
//  static void editname( context) {
//    Navigator.pushNamed(context, "/EditName");
//  }
//
//  static void editcity( context) {
//    Navigator.pushNamed(context, "/EditCity");
//  }
//
//  static void editemail( context) {
//    Navigator.pushNamed(context, "/EditEmail");
//  }
}