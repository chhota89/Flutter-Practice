import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityPage extends StatefulWidget {
  @override
  _ConnectivityPageState createState() => new _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  var list;

  Future getData() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/posts/");
    if (response.statusCode == HttpStatus.OK) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Connectivity"),
        ),
        body: RefreshIndicator(
          onRefresh: () {},
          child: _buildLayoutCheckInternet(),
        ));
  }

  Widget _buildList() {
    return Container();
  }

//  Future<Null> _onRefresh() async {
//    ConnectivityResult result = await checkInternetConnectivity();
//    if(results.)
//  }

  Future<ConnectivityResult> checkInternetConnectivity() async {
    final Connectivity connectivity = new Connectivity();

    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
    return connectivity.checkConnectivity();
//    } catch (e) {
//      print(e.toString());
//      connectionStatus = 'Failed to get connectivity.';
//    }
  }

  Widget _buildLayoutCheckInternet() {
    return new FutureBuilder(
        future: checkInternetConnectivity(),
        builder: (context, connection) {
          if (connection.hasData) {
            var data = connection.data;
            print(data);
            if (data == ConnectivityResult.none) {
              return _getNoInternetView();
            } else
              return _buildFutureBuilder();
          } else {
            return new Container();
          }
        });
  }

  Widget _getNoInternetView() {
    return new Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset('assets/no_internet.png', height: 100.0),
          new Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
          new Text(
            'No internet Connection',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          new Padding(padding: const EdgeInsets.only(top: 10.0)),
          new Text("Pull down to refresh")
        ],
      ),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return new ListView.builder(
            itemBuilder: (context, i) {
              return new Card(
                elevation: 2.0,
                child: new ListTile(
                  title: Text(data[i]['title']),
                  subtitle: Text(data[i]['body']),
                ),
              );
            },
            itemCount: data.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
