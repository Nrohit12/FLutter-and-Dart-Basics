import 'package:flutter/material.dart';
import 'package:tomorrow/Search/searchpage.dart';
import 'dart:math';
import 'package:tomorrow/jsongenerator/tripData.dart';
import 'package:tomorrow/jsongenerator/personData.dart';
import 'package:tomorrow/jsongenerator/newTrip.dart';


class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationControllerMenu;
  Animation<double> animationMenu;
  Animation<double> animationTitleFadeInOut;
  _GuillotineAnimationStatus menuAnimationStatus;

  @override
  void initState() {
    super.initState();
    menuAnimationStatus = _GuillotineAnimationStatus.closed;

    animationControllerMenu = new AnimationController(
        duration: const Duration(
          milliseconds: 1000,
        ),
        vsync: this)
      ..addListener(() {});

    animationMenu =
    new Tween(begin: -pi / 2.0, end: 0.0).animate(new CurvedAnimation(
      parent: animationControllerMenu,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ))
      ..addListener(() {
        setState(() {
          // force refresh
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          menuAnimationStatus = _GuillotineAnimationStatus.open;
        } else if (status == AnimationStatus.dismissed) {
          menuAnimationStatus = _GuillotineAnimationStatus.closed;
        } else {
          menuAnimationStatus = _GuillotineAnimationStatus.animating;
        }
      });

    animationTitleFadeInOut =
        new Tween(begin: 1.0, end: 0.0).animate(new CurvedAnimation(
          parent: animationControllerMenu,
          curve: new Interval(
            0.0,
            0.5,
            curve: Curves.ease,
          ),
        ));
  }

  @override
  void dispose() {
    animationControllerMenu.dispose();
    super.dispose();
  }

  void _playAnimation() {
    try {
      if (menuAnimationStatus == _GuillotineAnimationStatus.animating) {
      } else if (menuAnimationStatus == _GuillotineAnimationStatus.closed) {
        animationControllerMenu.forward().orCancel;
      } else {
        animationControllerMenu.reverse().orCancel;
      }
    } on TickerCanceled {
      // the animation go cancelled, probably because disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double angle = animationMenu.value;

    return new Transform.rotate(
      angle: angle,
      origin: new Offset(24.0, 56.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color:  Color.fromRGBO(106,27,154, 0.9),
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: 32.0,
                left: 40.0,
                width: screenWidth,
                height: 24.0,
                child: new Transform.rotate(
                    alignment: Alignment.topLeft,
                    origin: Offset.zero,
                    angle: pi / 2.0,
                    child: new Center(
                      child: new Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: new Opacity(
                          opacity: animationTitleFadeInOut.value,
                          child: new Text('Tripify',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              )),
                        ),
                      ),
                    )),
              ),

              new Positioned(
                top: 32.0,
                right: 4.0,
                child: new IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: (){ Navigator.push(context, SlideRightRoute(page: SearchPage()));},
                ),
              ),

              new Positioned(
                top: 32.0,
                right: 50.0,
                child: new IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: ()=> print('Search'),
                ),
              ),
              
              new Positioned(
                top: 32.0,
                left: 4.0,
                child: new IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: _playAnimation,
                ),
              ),

              new Padding(
                padding: const EdgeInsets.only(left: 64.0, top: 96.0),
                child: new Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: ListTile(
                          title: RaisedButton(
                            onPressed: (){ Navigator.push(context, FadeRoute(page: Profile()));},
                            child: Text('Profile', style: sty2,),
                          ),
                          leading: Icon(Icons.person,color: color,),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: RaisedButton(
                            onPressed: (){ Navigator.push(context, FadeRoute(page: Trips()));},
                            child: Text('Trips', style: sty2,),
                          ),
                          leading: Icon(Icons.view_agenda,color: color,),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: RaisedButton(
                            onPressed: (){ Navigator.push(context, FadeRoute(page: NewTrip()));},
                            child: Text('New Trips', style: sty2,),
                          ),
                          leading: Icon(Icons.swap_calls,color: color,),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: RaisedButton(
                            onPressed: (){},
                            child: Text('Demo', style: sty2,),
                          ),
                          leading: Icon(Icons.desktop_mac,color: color, ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color color = Colors.white;

TextStyle sty2 = TextStyle(
  color: Colors.black,
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
  //letterSpacing: 0.3,
);

enum _GuillotineAnimationStatus { closed, open, animating }

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
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
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
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
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}