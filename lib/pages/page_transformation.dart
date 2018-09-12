import 'package:flutter/material.dart';

// TODO https://medium.com/flutter-community/make-3d-flip-animation-in-flutter-16c006bb3798
class PageTransformationExample extends StatefulWidget {
  @override
  _PageTransformationExampleState createState() =>
      new _PageTransformationExampleState();
}

class _PageTransformationExampleState extends State<PageTransformationExample> {
  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    return new Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy) // changed
          ..rotateY(-0.01 * _offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector(
          // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        ));
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("3D transform screen"),
      ),
      body: new Center(
        child:
            Text("Hi sample text", style: Theme.of(context).textTheme.display3),
      ),
    );
  }
}
