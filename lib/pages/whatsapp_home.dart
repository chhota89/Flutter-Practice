import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chat_history_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "CALL"),
              new Tab(text: "STATUS"),
              new Tab(text: "CHAT")
            ]),
      ),
      body: new TabBarView(controller: _tabController, children: [
        new Center(child: new Text("camera")),
        new Center(child: new Text("call")),
        new Center(child: new Text("status")),
        new Center(child: new Text("chat"))
      ]),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(Icons.message, color: Colors.white),
          onPressed: () => print("open Chats")),
    );
  }
}
