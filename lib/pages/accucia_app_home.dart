import 'package:flutter/material.dart';
import 'developer_page.dart';

class AccuciaHome extends StatefulWidget {
  @override
  _AccuciaHomeState createState() => new _AccuciaHomeState();
}

//FadeInImage.memoryNetwork(
//placeholder: kTransparentImage,
//image:
//'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//)

class _AccuciaHomeState extends State<AccuciaHome> {
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.purple
  ];

  Widget _buildColorList(BuildContext context, int index) {
    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          height: 160.0,
          color: colors[index],
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Accucia Softwares"),
          actions: <Widget>[MoreButtonOption()],
        ),
        body: new Column(
          children: <Widget>[
            FadeInImage(
                placeholder: AssetImage('assets/company_logo.png'),
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/smspad%20app.jpg?alt=media&token=8cefb14c-01d0-4f0d-ac88-7a36f7e24c97'),
                fadeOutDuration: new Duration(milliseconds: 300),
                fadeOutCurve: Curves.decelerate),
            new SizedBox(
              height: 160.0,
              child: ListView.builder(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                itemBuilder: _buildColorList,
                itemCount: colors.length,
                itemExtent: 160.0,
              ),
            ),
          ],
        )

//      new Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new SizedBox(
//              height: 240.0,
//              child: new Carousel(
//                children: [
//                  new NetworkImage(
//                      'https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/smspad%20app.jpg?alt=media&token=8cefb14c-01d0-4f0d-ac88-7a36f7e24c97'),
//                  new NetworkImage(
//                      'https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/mym%20ps%20banner%20low.jpg?alt=media&token=ca87458b-fb30-492c-8baf-d9e4db48dc15')
//                ]
//                    .map((netImage) =>
//                        new Image(image: netImage, fit: BoxFit.cover))
//                    .toList(),
//              ),
//            ),
//
//          ]),
        );
  }
}

class MoreButtonOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          new PopupMenuItem(
              child: new ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
          )),
          new PopupMenuItem(
              child: new ListTile(
            title: Text("Rate"),
            leading: Icon(Icons.star),
          )),
          new PopupMenuItem(
              child: new ListTile(
            title: Text("Developer"),
            leading: Icon(Icons.computer),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeveloperPage()),
              );
            },
          ))
        ];
      },
    );
  }
}
