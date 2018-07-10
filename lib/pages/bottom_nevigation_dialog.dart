import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MaterialPage extends StatefulWidget {
  @override
  _MaterialPageState createState() => new _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Material Page"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(choices[0].icon),
              onPressed: () {
                _onNegationItemSelected(choices[0]);
              }),
          new IconButton(
              icon: new Icon(choices[1].icon),
              onPressed: () {
                _onNegationItemSelected(choices[1]);
              }),
          //overflow menu
          new PopupMenuButton(
            onSelected: _onNegationItemSelected,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return new PopupMenuItem(
                    value: choice, child: new Text(choice.title));
              }).toList();
            },
          )
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
                onPressed: _neverSatisfied,
                color: Colors.redAccent,
                textColor: Colors.white,
                child: new Text("Alert dialog")),
            new Padding(padding: const EdgeInsets.only(top: 10.0)),
            new RaisedButton(
                onPressed: _showBottomSheet,
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: new Text("BottomSheet")),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("share button click");
          Share.share("djksfjslkj");
        },
        child: new Icon(Icons.share, color: Colors.white),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text(
                      'This is the modal bottom sheet. Click anywhere to dismiss.',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }

  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Rewind and remember'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('You will never be satisfied.'),
                  new Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _onNegationItemSelected(Choice choice) {
    print(choice.title);
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];
