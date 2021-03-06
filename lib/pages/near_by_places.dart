import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/place_details_screen.dart';
import '../main.dart';

class Places {
  String icon;
  String id;
  String name;
  num rating;
  String vicinity;

  Places(this.icon, this.id, this.name, this.rating, this.vicinity);
}

class PlaceServices {
  static final _service = new PlaceServices();

  static PlaceServices get() {
    return _service;
  }

  Future<List<Places>> getListPlaces(
      String placeType, double lat, double lng) async {
    var placeUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&radius=1500&type=${placeType}&key=AIzaSyAGj8s0vkxHJWuP3jxbMb66h91cdd0Eu_E";
    var response =
        await http.get(placeUrl, headers: {"Accept": "application/json"});

    var places = <Places>[];
    List data = json.decode(response.body)["results"];
    data.forEach((f) => places.add(
        new Places(f["icon"], f["id"], f["name"], f["rating"], f["vicinity"])));
    return places;
  }
}

class PlacesListScreenPage extends StatefulWidget {
  PlacesListScreenPage({this.name, this.placeType, this.lat, this.lng})
      : assert(placeType != null),
        assert(name != null);

  double lat;
  double lng;
  final String placeType;
  final String name;

  @override
  _PlacesListScreenPageState createState() => new _PlacesListScreenPageState();
}

class _PlacesListScreenPageState extends State<PlacesListScreenPage> {
  List<Places> _places;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PlaceServices
        .get()
        .getListPlaces(this.widget.placeType, this.widget.lat, this.widget.lng)
        .then((data) {
      this.setState(() {
        _places = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby Places"),
      ),
      body: _createContent(),
    );
  }

  Widget _createContent() {
    if (_places == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView(
          children: _places.map((f) {
        return new Card(
          elevation: 3.0,
          child: new ListTile(
            title: new Text(f.name),
            leading: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: new Image.network(f.icon)),
            subtitle: new Text(f.vicinity),
            trailing: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                new Text(f.rating.toString())
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new PlaceDetailsScreen()));
            },
          ),
        );
      }).toList());
    }
  }
}
