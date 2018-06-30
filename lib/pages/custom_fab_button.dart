import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomFabPage extends StatefulWidget {
  @override
  _CustomFabPageState createState() => new _CustomFabPageState();
}

class _CustomFabPageState extends State<CustomFabPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Custom Fab"),
      ),
      floatingActionButton: FancyFab(onPressed: () {}),
    );
  }
}

class FancyFab extends StatelessWidget {
  FancyFab({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
        onPressed: onPressed,
        fillColor: Colors.orangeAccent,
        splashColor: Colors.orange,
        shape: const StadiumBorder(),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Icon(Icons.explore, color: Colors.white),
              SizedBox(width: 8.0),
              Text("Purchase", style: TextStyle(color: Colors.white)),
            ],
          ),
        ));
  }
}
