import 'package:flutter/material.dart';

class DrawerItem{
  String title;
  IconData iconData;

  DrawerItem(this.title,this.iconData);
}

class DrawerPage extends StatefulWidget {
  final drawerItem = [
    new DrawerItem("Fragment 1", Icons.shopping_cart),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ];

  @override
  _DrawerPageState createState() => new _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItem(int pos){
    switch(pos){
      case 0:
        return new FirstFragment();

      case 1:
        return new TwoFragment();

      case 2:
        return new ThreeFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOption = <Widget>[];
    for(var i=0; i< widget.drawerItem.length; i++){
      var d = widget.drawerItem[i];
      drawerOption.add(
        new ListTile(
          leading: new Icon(d.iconData),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItem[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOption)
          ],
        ),
      ),
      body: _getDrawerItem(_selectedDrawerIndex),
    );
  }
}

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Shopping 1"),
    );
  }

}

class TwoFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Pizza"),
    );
  }

}


class ThreeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Info Fragment"),
    );
  }

}

