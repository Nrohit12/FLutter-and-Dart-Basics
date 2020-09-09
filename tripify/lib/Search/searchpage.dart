import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class SearchPage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _filter = TextEditingController();
  var dio =  Dio();
  String _searchText = "";
  List names = List();
  List filteredNames = List();

  _SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(106,27,154, 0.9),
        title: TextField(
          style: TextStyle(
            color: Colors.white
          ),
          controller: _filter,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              hintText: 'Search Destination...',
              hintStyle: TextStyle(
                color: Colors.white
              )
          ),
        ),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }


  Widget _buildList() {
    if ((_searchText.isNotEmpty)) {
      List tempList = List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['destination'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index]['destination']),
          onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailPage(names[index]))
          );},
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
      names.shuffle();
      filteredNames = names;
    });
  }
}

class DetailPage extends StatelessWidget {

  DetailPage(this.data);

  final data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
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