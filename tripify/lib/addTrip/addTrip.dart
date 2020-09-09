import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';


class AddTrip extends StatefulWidget {
  @override
  _AddTripState createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            decor,
            IconButton(
              padding: EdgeInsets.only(top: 40.0,),
              icon: icon,
              onPressed: (){Navigator.pop(context);},
            ),
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    save,
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    form,
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    RaisedButton(
                      onPressed: () {Navigator.pop(context);},
                      child: signin,
                      color: Colors.white,
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}


TextStyle sty = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  //letterSpacing: 0.3,
);

Text save = Text("Edit ",
    softWrap: true,
    style: sty
);


Icon icon = Icon(
  Icons.arrow_back,
  size: 25.0,
  color: Colors.green,
);

Container decor = Container(
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
);

Form form = Form(

  child: Column(
    children: <Widget>[
      Container(
        child: TextFormField(
          style: TextStyle(fontSize: 15.0,color: Colors.green),
          decoration: InputDecoration(
              suffix: IconButton(
                icon: Icon(Icons.cancel),
                //onPressed: LoginPage().clear(),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0)
                  ),
                  borderSide: BorderSide(width: 20.0, color: Colors.teal)
              ),
              labelText: 'Source',
              hintText: 'Start',
              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
          ),
          keyboardType: TextInputType.text,
        ),
      ),
      Container(
        child: TextFormField(
          style: TextStyle(fontSize: 15.0,color: Colors.green),
          decoration: InputDecoration(
              suffix: IconButton(
                icon: Icon(Icons.cancel),
                //onPressed: LoginPage().clear(),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0)
                  ),
                  borderSide: BorderSide(width: 20.0, color: Colors.teal)
              ),
              labelText: 'Destination',
              hintText: 'Destination',
              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
          ),
          keyboardType: TextInputType.text,
        ),
      ),
      Container(
        child: TextFormField(
          style: TextStyle(fontSize: 15.0,color: Colors.green),
          decoration: InputDecoration(
              suffix: IconButton(
                icon: Icon(Icons.cancel),
                //onPressed: LoginPage().clear(),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0)
                  ),
                  borderSide: BorderSide(width: 20.0, color: Colors.teal)
              ),
              labelText: 'Date',
              hintText: 'Due Date...',
              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
          ),
          keyboardType: TextInputType.text,
        ),
      ),
      Container(
        child: TextFormField(
          style: TextStyle(fontSize: 15.0,color: Colors.green),
          decoration: InputDecoration(
              suffix: IconButton(
                icon: Icon(Icons.cancel),
                //onPressed: LoginPage().clear(),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0)
                  ),
                  borderSide: BorderSide(width: 20.0, color: Colors.teal)
              ),
              labelText: 'Deadline',
              hintText: 'Ends in...',
              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
          ),
          keyboardType: TextInputType.text,
        ),
      ),
      Container(
        child: TextFormField(
          style: TextStyle(fontSize: 15.0,color: Colors.green),
          decoration: InputDecoration(
              suffix: IconButton(
                icon: Icon(Icons.cancel),
                //onPressed: LoginPage().clear(),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0)
                  ),
                  borderSide: BorderSide(width: 20.0, color: Colors.teal)
              ),
              labelText: 'Comments',
              hintText: 'About the Trip',
              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
          ),
          keyboardType: TextInputType.text,
        ),
      ),

    ],
  ),
);

Container signin = Container(
  width: 100.0,
  height: 50.0,
  alignment: FractionalOffset.center,

  decoration: BoxDecoration(
    color: Colors.white,
    //borderRadius: BorderRadius.all(const Radius.circular(30.0)),
  ),
  child: Text(
    "Save",
    style: sty,
  ),
);