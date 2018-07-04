import 'package:flutter/material.dart';

class ScatchDrawPage extends StatefulWidget {
  @override
  _ScatchDrawPageState createState() => new _ScatchDrawPageState();
}

class _ScatchDrawPageState extends State<ScatchDrawPage> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails endDetails) => _points.add(null),
          child: new CustomPaint(
            painter: new Signature(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
        ..strokeWidth = 10.0;

    for(int i=0; i< points.length; i++){
      if(points[i] != null && points[i+1] != null){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }
}
