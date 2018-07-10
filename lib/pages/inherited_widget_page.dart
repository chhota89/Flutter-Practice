import 'package:flutter/material.dart';
import 'dart:math';

//Notes We can directly make our MyApp class as StatefulWidget widget
// and no need to create InheritedWidgetPageExample
class InheritedWidgetPageExample extends StatefulWidget {
  @override
  _InheritedWidgetPageExampleState createState() =>
      new _InheritedWidgetPageExampleState();
}

class _InheritedWidgetPageExampleState
    extends State<InheritedWidgetPageExample> {
  final Random _random = Random();
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return new ColorState(
      onTap: onTap,
      color: color,
      child: BoxTree(),
    );
  }

  void onTap() {
    setState(() {
      color = Color.fromRGBO(_random.nextInt(255), _random.nextInt(255),
          _random.nextInt(255), _random.nextDouble());
    });
  }
}

class ColorState extends InheritedWidget {
  ColorState({Key key, this.color, this.onTap, Widget child})
      : super(key: key, child: child);
  final Color color;
  final Function onTap;

  @override
  bool updateShouldNotify(ColorState oldWidget) {
    return color != oldWidget.color;
  }

  static ColorState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ColorState);
  }
}

class BoxTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[Box(), Box()],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorState = ColorState.of(context);
    return new GestureDetector(
      onTap: colorState.onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        margin: const EdgeInsets.only(left: 100.0),
        color: colorState.color,
      ),
    );
  }
}
