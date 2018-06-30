import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/place_details_screen.dart';

class Places{
  String icon;
  String id;
  String name;
  num rating;
  String vicinity;

  Places(this.icon,this.id,this.name,this.rating,this.vicinity);
}

class PlaceServices{
  static final _service = new PlaceServices();

  static PlaceServices get(){
    return _service;
  }

  final String placeUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyAGj8s0vkxHJWuP3jxbMb66h91cdd0Eu_E";

  Future<List<Places>> getListPlaces() async{
    var response = await http.get(placeUrl,headers: {
      "Accept" : "application/json"
    });

    var places = <Places>[];
    List data = json.decode(response.body)["results"];
    data.forEach((f) => places.add(new Places(f["icon"], f["id"], f["name"], f["rating"], f["vicinity"])));
    return places;
  }
}

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => new _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {

  List<Places> _places;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PlaceServices.get().getListPlaces().then((data) {
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

  Widget _createContent(){
    if(_places == null){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new ListView(
        children: _places.map((f){
          return new Card(
            child: new ListTile(
              title: new Text(f.name),
              leading: new Image.network(f.icon),
              subtitle: new Text(f.vicinity),
              trailing: new Row(
                children: <Widget>[
                  new Icon(Icons.star, color: Colors.redAccent,),
                  new Text(f.rating.toString())
                ],
              ),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new PlaceDetailsScreen()));
              },
            ),
          );
        }).toList()
      );
    }
  }
}



