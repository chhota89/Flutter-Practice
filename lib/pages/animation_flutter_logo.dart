import 'package:flutter/material.dart';

//TODO https://blog.geekyants.com/flutter-login-animation-ab3e6ed4bd19
class AnimationFlutterLogoPage extends StatefulWidget {
  @override
  _AnimationFlutterLogoPageState createState() =>
      new _AnimationFlutterLogoPageState();
}

class _AnimationFlutterLogoPageState extends State<AnimationFlutterLogoPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    animation = Tween(begin: 0.0, end: 500.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LogoWidget(animation: animation);
  }
}

class LogoWidget extends AnimatedWidget {
  LogoWidget({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(
      child: new Container(
          height: animation.value,
          width: animation.value,
          child: FlutterLogo()),
    );
  }
}
