import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/physics.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: "Animation Main Page"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Easing animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new EasingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Offset & Delay animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new OffsetDelayAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Parenting animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ParentingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Transformation animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new TransformationAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Value Change animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ValueChangeAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Masking animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new MaskingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Physics animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new SpringFreeFallingAnimation()));
              },
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class EasingAnimationWidget extends StatefulWidget {
  @override
  EasingAnimationWidgetState createState() => EasingAnimationWidgetState();
}

class EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with TickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Transform(
                transform:
                Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
                child: new Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.black12,
                    )),
              ));
        });
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))..addStatusListener(handler);
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


class MaskingAnimationWidget extends StatefulWidget {
  @override
  MaskingAnimationWidgetState createState() =>
      MaskingAnimationWidgetState();
}

class MaskingAnimationWidgetState extends State<MaskingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> transitionTween;
  Animation<BorderRadius> borderRadius;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: new Center(
                child: new Stack(
                  children: <Widget>[
                    new Center(
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          color: Colors.black12,
                        )),
                    new Center(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: transitionTween.value,
                          height: transitionTween.value,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: borderRadius.value,
                          ),
                        )),
                  ],
                )));
      },
    );
  }
}

class OffsetDelayAnimationWidget extends StatefulWidget {
  @override
  OffsetDelayAnimationWidgetState createState() =>
      OffsetDelayAnimationWidgetState();
}

class OffsetDelayAnimationWidgetState extends State<OffsetDelayAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _lateAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener(handler);

    _lateAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));
      _lateAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.2,
            1.0,
            curve: Curves.fastOutSlowIn,
          )))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              body: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                      child: new Center(
                          child:
                          new ListView(shrinkWrap: true, children: <Widget>[
                            Transform(
                                transform: Matrix4.translationValues(
                                  _animation.value * width,
                                  0.0,
                                  0.0,
                                ),
                                child: new Center(
                                    child: new Container(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 30.0,
                                        color: Colors.black12,
                                      ),
                                    ))),
                            Transform(
                                transform: Matrix4.translationValues(
                                  _animation.value * width,
                                  0.0,
                                  0.0,
                                ),
                                child: new Center(
                                    child: new Container(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 30.0,
                                        color: Colors.black12,
                                      ),
                                    ))),
                            Transform(
                                transform: Matrix4.translationValues(
                                  _lateAnimation.value * width,
                                  0.0,
                                  0.0,
                                ),
                                child: new Center(
                                    child: new Container(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 30.0,
                                        color: Colors.black12,
                                      ),
                                    ))),
                          ])))));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ParentingAnimationWidget extends StatefulWidget {
  @override
  ParentingAnimationWidgetState createState() =>
      ParentingAnimationWidgetState();
}

class ParentingAnimationWidgetState extends State<ParentingAnimationWidget>
    with TickerProviderStateMixin {
  Animation growingAnimation;
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    growingAnimation = Tween(begin: 10.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    animation = Tween(begin: -0.25, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              body: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                      child: new Center(
                          child:
                          new ListView(shrinkWrap: true, children: <Widget>[
                            Transform(
                                transform: Matrix4.translationValues(
                                    animation.value * width, 0.0, 0.0),
                                child: new Center(
                                    child: Container(
                                      height: growingAnimation.value,
                                      width: growingAnimation.value * 2,
                                      color: Colors.black12,
                                    ))),
                            Transform(
                                transform: Matrix4.translationValues(
                                  animation.value * width,
                                  0.0,
                                  0.0,
                                ),
                                child: new Center(
                                    child: new Container(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 100.0,
                                        color: Colors.black12,
                                      ),
                                    ))),
                          ])))));
        });
  }
}


class SpringFreeFallingAnimation extends StatefulWidget {
  SpringFreeFallingAnimationState createState() =>
      new SpringFreeFallingAnimationState();
}

class SpringFreeFallingAnimationState extends State<SpringFreeFallingAnimation>
    with SingleTickerProviderStateMixin {

  double _squareEdgeSize = 200.0;
  SpringDescription _spring = new SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0);
  SpringSimulation _springSimulation;
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    _springSimulation = new SpringSimulation(_spring, _squareEdgeSize, height, _animationController.velocity);
    startAnimationWithDelay();
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Transform(
                transform: Matrix4.translationValues(0.0, _squareEdgeSize - 200.0, 0.0),
                child: new Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.black12,
                    )),
              ));
        });
  }

  @override
  initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    )..addListener(() {
      setState(() {
        _squareEdgeSize = _animationController.value;
      });
    });
  }

  void startAnimationWithDelay() async {
    if (!_animationController.isAnimating) {
      await new Future.delayed(const Duration(milliseconds: 500));
      _animationController.animateWith(_springSimulation);
    }
  }
}

class TransformationAnimationWidget extends StatefulWidget {
  @override
  TransformationAnimationWidgetState createState() =>
      TransformationAnimationWidgetState();
}

class TransformationAnimationWidgetState
    extends State<TransformationAnimationWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> transitionTween;
  Animation<BorderRadius> borderRadius;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: new Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                width: transitionTween.value,
                height: transitionTween.value,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: borderRadius.value,
                ),
              ),
            ));
      },
    );
  }
}

class ValueChangeAnimationWidget extends StatefulWidget {
  @override
  ValueChangeAnimationWidgetState createState() =>
      ValueChangeAnimationWidgetState();
}

class ValueChangeAnimationWidgetState
    extends State<ValueChangeAnimationWidget> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    final Animation curve =
    CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = IntTween(begin: 0, end: 10).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: new Center(
                child: Text(animation.value.toString(), style: TextStyle(fontSize: 48.0)),
              ));
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}