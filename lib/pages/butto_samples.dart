import 'package:flutter/material.dart';

class ButtonSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return new Scaffold(
        appBar: AppBar(
          title: Text("Button Sample"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(onPressed: () {}, child: Text("Raise Button")),
                  RaisedButton(onPressed: null, child: Text("Raise Disable")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(onPressed: () {}, child: Text("Flat")),
                  FlatButton(onPressed: null, child: Text("Flat disable")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.headset),
                      label: Text("Head phone")),
                  RaisedButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.headset),
                      label: Text("Head phone")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
//                  FloatingActionButton(onPressed: () {}, child: Text("Add")),
                ],
              ),
              Row(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(39.0),
                    shadowColor: Colors.lightGreen.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                        onPressed: () {},
                        height: 42.0,
                        minWidth: 200.0,
                        color: Colors.greenAccent,
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
