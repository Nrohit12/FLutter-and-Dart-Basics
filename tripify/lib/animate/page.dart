import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:tomorrow/addTrip/addTrip.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {

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
        if (index.isOdd) {
        return Container(
          child: ListTile(
            title: Text(names[index]['destination'],style: sty2,),
            //trailing: Image.network(names[index]['image_url'],),

            onTap: (){ Navigator.push(context, ScaleRoute(page: DetailPage(names[index])));},

          ),

        );}
        return Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: ListTile(
            title: Text(names[index]['destination'],style: sty,),
            //trailing: Image.network(names[index]['image_url'],),

            onTap: (){ Navigator.push(context, ScaleRoute(page: DetailPage(names[index])));},

          ),

        );
      },
    );
  }


  void _getNames() async {
    final response = await dio.get('http://www.json-generator.com/api/json/get/bTMEOaILGW?indent=2');
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
        padding: EdgeInsets.only(top: 50.0),
        child: _buildList(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(207, 192, 216, 0.9),
                const Color.fromRGBO(248, 158, 230, 0.5),
              ],
              stops: [0.2, 1.0],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){ Navigator.push(context, ScaleRoute(page: AddTrip()));},
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
TextStyle sty2 = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  //letterSpacing: 0.3,
);

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