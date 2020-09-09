import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildBar(context),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("image/image.jpg"),
                ),
              ),
              ListTile(
                title: Text(
                  'First',
                  style: sty,
                ),
                onTap: ()=> print("First is Pressed"),
              ),
              ListTile(
                title: Text(
                  'Second',
                  style: sty,
                ),
                onTap: ()=> print("Second is Pressed"),
              ),
              ListTile(
                title: Text(
                  'Third',
                  style: sty,
                ),
                onTap: ()=> print("Third is Pressed"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            tab1,
            tab2,
            tab3
          ],
        ),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: appBarTitle,
      bottom: TabBar(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.amber,
        tabs: <Widget>[
          Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Tab 1'),
                  Icon(Icons.assignment),
                ],
              )
          ),
          Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Tab 2'),
                  Icon(Icons.announcement),
                ],
              )
          ),
          Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Tab 3'),
                  Icon(Icons.assignment_turned_in),
                ],
              )
          ),
        ],
      ),
    );
  }


  Widget appBarTitle =  Text(
    'Drawer App',
    style: sty,
  );

}


Center tab1 = Center(
  child: Card(
    child:  Container(
        height: 450.0,
        width: 300.0,
        child: IconButton(
          icon: Icon(Icons.assignment, size: 100.0),
          tooltip: 'Favorited',
          onPressed: null,
        )
    ),
  ),
);

Center tab2 = Center(
  child: Card(
    child:  Container(
        height: 450.0,
        width: 300.0,
        child: IconButton(
          icon: Icon(Icons.announcement, size: 100.0),
          onPressed: null,
        )
    ),
  ),
);

Center tab3 = Center(
  child: Card(
    child:  Container(
        height: 450.0,
        width: 300.0,
        child: IconButton(
          icon: Icon(Icons.assignment_turned_in, size: 100.0),
          onPressed: null,
        )
    ),
  ),
);

TextStyle sty = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 22.0,
);