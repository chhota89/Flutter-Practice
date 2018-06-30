import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
class RestExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Rest Example"),
      ),

      body: new Center(
        child: new FutureBuilder<Post>(
          future: featchPsot(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return new Text(snapshot.data.title);
              }else if(snapshot.hasError){
                return new Text("${snapshot.error}");
              }

              return new CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}

Future<Post> featchPsot() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId,this.id,this.title,this.body});

  factory Post.fromJson(Map<String,dynamic> json){
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
