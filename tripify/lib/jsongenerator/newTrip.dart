import 'dart:core';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';


class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips',
          style: sty,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(106,27,154, 0.9),
      ),
      body: Listview(),
    );
  }
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {

  var dio =  Dio();
  List names = List();

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: names == null ? 0 : names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(names[index]['destination']),
          onTap: () {Navigator.push(context, ScaleRoute(page: DetailPage(names[index])));},
        );
      },
    );
  }


  void _getNames() async {
    final response = await dio.get('http://www.json-generator.com/api/json/get/cfYBjddYSW?indent=2');
    List tempList = List();
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    setState(() {
      names = tempList;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}

TextStyle sty = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  //letterSpacing: 0.3,
);

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
        label: Text("Request"),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
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
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}