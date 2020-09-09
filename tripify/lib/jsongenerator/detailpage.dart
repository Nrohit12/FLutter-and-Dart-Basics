import 'dart:core';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  DetailPage(this.data);

  final data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(106,27,154, 0.9),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 15.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: ListTile(
                title: Text("Username : ${data["username"].toString()}",style: sty,),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("Source : ${data["source"].toString()}",style: sty,),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("Destination : ${data["destination"].toString()}",style: sty,),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("Date : ${data["date"].toString()}",style: sty,),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("Deadline : ${data["deadline"].toString()}",style: sty,),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("About : ${data["comments"].toString()}",style: sty,),
              ),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon : Icon(Icons.account_circle,),
        label: Text("Message"),
      ),
    );
  }
}

TextStyle sty = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  //letterSpacing: 0.3,
);

class Button extends StatelessWidget {
  const Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
        child: Text(
          "Request",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "You pushed the button ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black54,
          ),
        );
      },
    );
  }
}