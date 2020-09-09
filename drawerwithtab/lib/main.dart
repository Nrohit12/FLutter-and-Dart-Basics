import 'package:flutter/material.dart';

import 'package:drawerwithtab/homepage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: HomePage(),
    );
  }
}
