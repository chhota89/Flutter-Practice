import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImagePage extends StatefulWidget {
  @override
  _SvgImagePageState createState() => new _SvgImagePageState();
}

class _SvgImagePageState extends State<SvgImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Svg image"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            child: new SvgPicture.asset(
              'assets/images/globe.svg',
            ),
          ),
          new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('AB'),
            ),
            label: new Text('Aaron Burr'),
          )
        ],
      ),
    );
  }
}
