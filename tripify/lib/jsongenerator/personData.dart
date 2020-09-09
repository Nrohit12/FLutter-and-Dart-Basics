import 'package:flutter/material.dart';

import 'package:tomorrow/profile/profilesettings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: sett_sty,),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight
              ),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  buildimage(),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  builddetails(context),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget buildimage(){
  return Container(
    child: GestureDetector(
        onTap: () { print("Image Container was tapped"); },//to edit image
        child: CircleAvatar(
          backgroundColor: Colors.white70,
          backgroundImage: AssetImage("assets/tripify.jpeg"),//image with icon of editing
          maxRadius: 60.0,
        )
    ),
  );
}

Widget builddetails(context){
  return ListBody(
    children: <Widget>[
      username(context),
      name(context),
      email(context),
      home_city(context),
      phone(context),
      gender(context),
      profession(context),
      button(context)
    ],
  );
}

Widget username(context) => Container(
  child: ListTile(
    title: Text(
      "Username",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "rohit",
      style: sty2,
    ),
  ),
);

Widget name(context) => Container(
  child: ListTile(
    title: Text(
      "Name",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "Rohit",
      style: sty2,
    ),
  ),
);

Widget email(context) => Container(
  child: ListTile(
    title: Text(
      "Email",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "17150@iiitu.ac.in",
      style: sty2,
    ),
  ),
);
Widget home_city(context) => Container(
  child: ListTile(
    title: Text(
      "City",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "Hamirpur",
      style: sty2,
    ),
  ),
);
Widget phone(context) => Container(
  child: ListTile(
    title: Text(
      "Phone",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "7091974821",
      style: sty2,
    ),
  ),
);
Widget gender(context) => Container(
  child: ListTile(
    title: Text(
      "Gender",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "Male",
      style: sty2,
    ),
  ),
);
Widget profession(context) => Container(
  child: ListTile(
    title: Text(
      "Profession",
      style: sty1,
    ),
//    contentPadding: EdgeInsets.only(top: 5.0),
    subtitle: Text(
      "Student",
      style: sty2,
    ),
  ),
);


Widget button(context) => FloatingActionButton(
  onPressed: (){ Navigator.push(context, SizeRoute(page: EditProfile()));},
  splashColor: Colors.white,
  backgroundColor: Colors.deepPurple,
  child: Text('Edit'),

);

TextStyle sett_sty = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  //letterSpacing: 0.3,
);

TextStyle sty2 = TextStyle(
  color: Colors.black,
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  //letterSpacing: 0.3,
);

TextStyle sty1 = TextStyle(
  color: Colors.black,
  fontSize: 10.0,
  fontWeight: FontWeight.w300,
  //letterSpacing: 0.3,
);

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}