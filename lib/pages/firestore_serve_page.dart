import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServePage extends StatefulWidget {
  @override
  _FirestoreServePageState createState() => new _FirestoreServePageState();
}

class _FirestoreServePageState extends State<FirestoreServePage> {
  final listItems = ["Radom Name", "Suman", "Sohel"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Band name serve")),
        body: new StreamBuilder(
            stream: Firestore.instance.collection("bandnames").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    //TODO error data.documents not found. Check for firestore version
                    _buildListItem(context, snapshot.data.documents[index]);
                  },
                  itemCount: snapshot.data.documets.length(),
                  itemExtent: 60.0,
                );
              }
            }));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          new Expanded(
              child: Text(document['name'],
                  style: Theme.of(context).textTheme.headline)),
          Container(
            decoration: const BoxDecoration(color: Colors.lightGreenAccent),
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(document['votes'].toString(),
                  style: Theme.of(context).textTheme.display1),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}
