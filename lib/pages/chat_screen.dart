import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  final reference = FirebaseDatabase.instance.reference().child('messages');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Friendlychat"),
        ),
        body: new Column(
          children: <Widget>[
            new Flexible(
                child: new FirebaseAnimatedList(
              padding: new EdgeInsets.all(5.0),
              reverse: true,
              query: reference,
              sort: (a, b) => b.key.compareTo(a.key),
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int position) {
                return new ChatMessage(
                    snapshot: snapshot, animation: animation);
              },
            )),
            new Divider(height: 3.0),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComponser(),
            )
          ],
        ));
  }

  Widget _buildTextComponser() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new IconButton(icon: new Icon(Icons.image,color: Colors.orangeAccent), onPressed: () => _openGalleryPicker()),
          ),
          new Flexible(
              child: new TextField(
            controller: _textEditingController,
            decoration:
                new InputDecoration.collapsed(hintText: 'Enter Message'),
          )),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(text: _textEditingController.text)),
          )
        ],
      ),
    );
  }

  Future _openGalleryPicker()async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    var random = new Random().nextInt(100000);
//    StorageReference storageRef = FirebaseStorage.instance.ref().child("image_$random.jpg");
//    StorageUploadTask task = storageRef.putFile(imageFile);
//    Uri downloadUrl = (await task.future).downloadUrl;
//    _handleSubmitted(imagePath:  downloadUrl.toString());
  }

  void _handleSubmitted({String text,String imagePath}) {
    _textEditingController.clear();

    reference.push().set({
      'text': text,
      'senderName': "Mohmad",
      'imagePath': imagePath,
      'time': new DateTime.now().millisecondsSinceEpoch,
    });

//    ChatMessage message = new ChatMessage(text: text);
//    setState(() {
//      _messages.insert(0, message);
//    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.snapshot, this.animation});
  final DataSnapshot snapshot;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new CircleAvatar(child: new Text('M')),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Mohmad', style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(snapshot.value['text']),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
