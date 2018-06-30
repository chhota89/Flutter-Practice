import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fist Page"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage(Colors.redAccent))
            );
          },
          child: new Text("Second page"),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {

  SecondPage(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Go back"),
        backgroundColor: color,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Second page"),
        ),
      ),
    );
  }
}
