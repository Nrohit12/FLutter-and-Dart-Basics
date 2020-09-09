import 'package:flutter/material.dart';


Widget row1() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Latest Jobs',style: sty),
  ],
);

Widget row2() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Admissions',style: sty),
  ],
);

Widget row3() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Scholarships',style: sty),
  ],
);

Widget row4() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Admit Cards',style: sty),
  ],
);

Widget row5() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Results',style: sty),
  ],
);

Widget row6() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Syllabus',style: sty),
  ],
);

Widget row7() => Row(
  children: <Widget>[
    Icon(Icons.email),
    Padding(padding: EdgeInsets.only(left: 5.0)),
    Text('Answer Keys',style: sty),
  ],
);

Widget row8() => Row(
  children: <Widget>[
    Text('About',style: sty),
  ],
);

TextStyle sty = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 12.0,
);