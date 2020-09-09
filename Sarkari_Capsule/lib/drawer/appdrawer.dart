import 'package:flutter/material.dart';

import 'package:sarkari_capsule/drawer/drawerlist.dart';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          head(),
          ListTile(
            title: row1(),
            onTap: () {},
          ),
          ListTile(
            title: row2(),
            onTap: () {},
          ),
          ListTile(
            title: row3(),
            onTap: () {},
          ),
          ListTile(
            title: row4(),
            onTap: () {},
          ),
          ListTile(
            title: row5(),
            onTap: () {},
          ),
          ListTile(
            title: row6(),
            onTap: () {},
          ),
          ListTile(
            title: row7(),
            onTap: () {},
          ),
          ListTile(
            title: row8(),
            onTap: () {},
          ),

        ],
      ),
    );
  }
}

Widget head() => UserAccountsDrawerHeader(
  accountName: Text(
    'Hello',
    style: sty
  ),//name of the user
  currentAccountPicture: Image(
    image: AssetImage('assetimage/logoimage.jpg'),),//image of user
  decoration: BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      image: AssetImage("assetimage/logoimage.jpg"),
      fit: BoxFit.fill,
    ),
  ),
);

TextStyle sty = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);


