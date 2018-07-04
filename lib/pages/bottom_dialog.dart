import 'package:flutter/material.dart';

class BottomDialogPage extends StatelessWidget {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Dialog"),
      ),
      body: new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight, // new
          end: Alignment.bottomCenter, // new
          // Add one stop for each color.
          // Stops should increase
          // from 0 to 1
          stops: [0.4, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's
            // Colors class.
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        )),
        child: Center(
          child: RaisedButton(
            child: const Text("Bottom Dilog"),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            crossAxisCount: 3,
                            children: colors.map((color) {
                              return new Container(
                                height: 160.0,
                                color: color,
                              );
                            }).toList(),
                          )),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
