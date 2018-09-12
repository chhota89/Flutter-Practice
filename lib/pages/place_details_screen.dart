import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/static_map_provider.dart';

class PlaceDetailsScreen extends StatefulWidget {
  @override
  _PlaceDetailsScreenState createState() => new _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  var provider = new StaticMapProvider('your_api_key');
  MapView mapView = new MapView();

  displayMap() {
    mapView.show(new MapOptions(
        mapViewType: MapViewType.normal,
        showUserLocation: true,
        initialCameraPosition:
            new CameraPosition(new Location(45.5235258, -122.6732493), 14.0),
        title: "Recently Visited"));
  }

  @override
  Widget build(BuildContext context) {
    List locations = <Location>[new Location(45.5235258, -122.6732493)];
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Map View Example'),
          ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new StaticMap("AIzaSyAYutNp_I3wpFvLJv8AyI-3cqoGEeMZ4OQ",
                  height: 300, width: 300, locations: locations, zoom: 14),
              new RaisedButton(
                  child: Text("Show Map"),
                  onPressed: () {
                    displayMap();
                  })
            ],
          )),
    );
  }
}

class StaticMap extends StatefulWidget {
  final List<Location> locations;
  final String googleMapsApiKey;
  final int width;
  final int height;
  final int zoom;

  StaticMap(this.googleMapsApiKey,
      {this.width, this.height, this.locations, this.zoom});
  @override
  _StaticMapState createState() => new _StaticMapState();
}

class _StaticMapState extends State<StaticMap> {
  String startUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2000px-Solid_white.svg.png';
  String nextUrl;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  Location defaultLocation = new Location(37.0902, -95.7192);

  _buildUrl(List locations, int width, int height) {
    var finalUri;
    var baseUri = new Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        port: 443,
        path: '/maps/api/staticmap',
        queryParameters: {});

    if (widget.locations.length == 1) {
      Location location = locations[0];
      finalUri = baseUri.replace(queryParameters: {
        'center': '${location.latitude},${location.longitude}',
        'zoom': widget.zoom.toString(),
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        '${widget.googleMapsApiKey}': ''
      });
    } else {
      List<String> markers = new List();
      widget.locations.forEach((location) {
        var lat = location.latitude;
        var lng = location.longitude;
        String marker = '$lat,$lng';
        markers.add(marker);
      });
      String markersString = markers.join('|');
      finalUri = baseUri.replace(queryParameters: {
        'markers': markersString,
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        '${widget.googleMapsApiKey}': ''
      });
    }
    setState(() {
      startUrl = nextUrl ?? startUrl;
      nextUrl = finalUri.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.locations.length == 0) {
      widget.locations.add(defaultLocation);
    }
    _buildUrl(widget.locations, widget.width ?? defaultWidth,
        widget.height ?? defaultHeight);
    return new Container(
        child: new FadeInImage(
      placeholder: new NetworkImage(startUrl),
      image: new NetworkImage(nextUrl),
    ));
  }
}
