import 'package:flutter/material.dart';

import 'package:sarkari_capsule/drawer/appdrawer.dart';

class SarkariCapsule extends StatefulWidget {
  @override
  _SarkariCapsuleState createState() => _SarkariCapsuleState();
}

class _SarkariCapsuleState extends State<SarkariCapsule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sarkari Capsule'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()=>Navigator.pushNamed(context, '/Search'),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Text("hello"),
    );
  }
}
