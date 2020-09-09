
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bmohomepage/bmo/molist.dart';

import 'package:flutter/material.dart';


class pending extends StatefulWidget {
  @override
  _pendingState createState() => _pendingState();
}

class _pendingState extends State<pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listview(),
    );
  }
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {

  Map user;
  List appli=[];
  List pending=[];

  Future getData() async {
    http.Response response = await http.get("http://www.json-generator.com/api/json/get/ceKGiMPTKG?indent=2");
    user = json.decode(response.body);
    setState(() {
      appli = user[""];
    });
    String display;
    for(int i=0;i<appli.length;i++){
      if(appli[i]["mo"]==null){
        pending.add(appli[i]);
      }

    };
  }

  @override
  void initState() {
    super.initState();
    getData();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(

          itemCount: pending == null ? 0 : pending.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(


              trailing: CircleAvatar(
                backgroundImage: AssetImage("assets/hpgovt.png"),
              ),
              title: Text("${pending[index]["application"]}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
              subtitle: Text("Asha :  ${pending[index]['ashaName']}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(pending[index]))
                );
              },
            );
          },
        )
    );
  }
}


class DetailPage extends StatelessWidget {

  DetailPage(this.appli);

  final appli;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("104"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 15.0),
        child: ListView(
          children: <Widget>[
            Text("Application Number : ${appli["application"].toString()}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Name : ${appli["name"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Address : ${appli["address"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Block : ${appli["block"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("District : ${appli["district"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Asha : ${appli["ashaName"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("ANM Assigned : ${appli["anmAssigned"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("ANM Officer: ${appli["anm"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("MO Assigned : ${appli["moAssigned"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton : FloatingActionButton.extended(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Molist()));},
        icon : Icon(Icons.account_circle,),
        label: Text("Assign MO"),
      ),

    );
  }
}