import 'package:flutter/material.dart';
import 'package:bmohomepage/bmo/page104.dart';
import 'package:bmohomepage/bmo/completedpage.dart';
import 'package:bmohomepage/bmo/pendingpage.dart';
import 'package:bmohomepage/bmo/anmlist.dart';
import 'package:bmohomepage/bmo/molist.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: BMOhomepage(),
    );
  }
}


class BMOhomepage extends StatefulWidget {
  BMOhomepage({ Key key }) : super(key: key);
  @override
  _BMOhomepageState createState() => _BMOhomepageState();
}

class _BMOhomepageState extends State<BMOhomepage> with SingleTickerProviderStateMixin{

  Widget appBarTitle =  Text(
    'Block Medical Officer( H.P. )',
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22.0,
    ),
  );
  Icon actionIcon = Icon(Icons.search, color: Colors.white,);
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 3,
        child: Scaffold(
          key: key,
          appBar: buildBar(context),
          body: TabBarView(
            children: <Widget>[
              page104,
              pending,
              completed,
            ],
          ),
          drawer: Drawer(
            child: ListView(children: <Widget>[
              UserAccountsDrawerHeader(
                //accountName: ,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/hpgovt.png"),
                ),
              ),
              ListTile(title: Text("MO", style: TextStyle(
                  color: Colors.black, fontSize: 20.0),),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext ctx) => Molist()));
                },
              ),
              ListTile(title: Text("ANMs", style: TextStyle(
                  color: Colors.black, fontSize: 20.0),),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext ctx) => Anmlist()));
                },
              ),
              ListTile(title: Text("About", style: TextStyle(
                  color: Colors.black, fontSize: 20.0),),
                onTap: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
//              Here I have not implemented an actual about screen, but if you did you would navigate to it's route
//              Navigator.of(context).pushReplacementNamed('/AboutScreen');
                },
              ),
            ],
            ),
          ),

        ),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        bottom: TabBar(
          labelPadding: EdgeInsets.only(left: 2.0,right: 5.0),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: <Widget>[
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('104'),
                    //Padding(padding: EdgeInsets.only(left: 5.0,bottom: 5.0)),
                    Icon(Icons.assignment),
                  ],
                )
            ),
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Pending'),
                    //Padding(padding: EdgeInsets.only(left: 8.0,bottom: 5.0,right: 5.0)),
                    Icon(Icons.announcement),
                  ],
                )
            ),
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Completed'),
                    //Padding(padding: EdgeInsets.only(left: 8.0,bottom: 5.0)),
                    Icon(Icons.assignment_turned_in),
                  ],
                )
            ),
          ],
        ),
    );
  }

}


Center page104 = Center(child: new Card(
  child: new Container(
      height: 450.0,
      width: 300.0,
      child: new IconButton(
        icon: new Icon(Icons.favorite, size: 100.0),
        tooltip: 'Favorited',
        onPressed: null,
      )
  ),
),
);


Center pending = Center(child: new Card(
  child: new Container(
      height: 450.0,
      width: 300.0,
      child: new IconButton(
        icon: new Icon(Icons.block, size: 100.0),
        tooltip: 'Favorited',
        onPressed: null,
      )
  ),
),
);


Center completed = Center(
  child: FutureBuilder<Post>(
    //future: ,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data.title);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  ),
);

Future<Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}