import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/near_by_places.dart';
import 'package:location/location.dart';

class PlaceType {
  PlaceType({this.name, this.placeType, this.imageUrl})
      : assert(name != null),
        assert(placeType != null),
        assert(imageUrl != null);

  final String name;
  final String placeType;
  final String imageUrl;
}

class PlaceTypePage extends StatelessWidget {
  var currentLocation = <String, double>{};
  final Location _location = new Location();

  final List<PlaceType> placeTypes = [
    PlaceType(name: "Airport", placeType: "airport", imageUrl: ""),
    PlaceType(name: "Bank", placeType: "bank", imageUrl: ""),
    PlaceType(name: "Bus Station", placeType: "bus_station", imageUrl: ""),
    PlaceType(name: "Hospital", placeType: "hospital", imageUrl: ""),
    PlaceType(name: "Fire Station", placeType: "fire_station", imageUrl: ""),
    PlaceType(name: "Gas Station", placeType: "gas_station", imageUrl: ""),
    PlaceType(name: "Train Station", placeType: "train_station", imageUrl: ""),
    PlaceType(name: "Police", placeType: "police", imageUrl: ""),
    PlaceType(name: "Post Office", placeType: "post_office", imageUrl: ""),
    PlaceType(name: "School", placeType: "school", imageUrl: ""),
    PlaceType(name: "Movie Theater", placeType: "movie_theater", imageUrl: "")
  ];

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    _location.getLocation.then((Map<String, double> value) {
      currentLocation = value;
      print(" ${currentLocation["latitude"]}  ${currentLocation["longitude"]}");
    });
    return new Scaffold(
      appBar: AppBar(
        title: Text("Selct Place type"),
      ),
      body: GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
          childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
          children: placeTypes.map((PlaceType place) {
            return new InkWell(
              child: new Card(
                elevation: 2.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(place.name, style: Theme.of(context).textTheme.title)
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new PlacesListScreen(
                              name: place.name,
                              placeType: place.placeType,
                              lat: currentLocation["latitude"],
                              lng: currentLocation["longitude"],
                            )));
              },
            );
          }).toList()),
    );
  }
}
