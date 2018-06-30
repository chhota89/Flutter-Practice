import 'package:flutter/material.dart';

class CollpsingToolbarPage extends StatefulWidget {
  @override
  _CollpsingToolbarPageState createState() => new _CollpsingToolbarPageState();
}

class _CollpsingToolbarPageState extends State<CollpsingToolbarPage> {
  final images = [
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/1.png?alt=media&token=c3cd271b-6998-422b-9c03-2ff084bd13d4",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/2.png?alt=media&token=8c2acd6f-c457-4164-b7f5-0dd8c4a1fdbb",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/3.png?alt=media&token=ca36ae9d-47e5-4764-b8ce-7da95aad2450",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/4.png?alt=media&token=d87cb108-1c83-4b1a-84de-2f0179043e6b",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/6.png?alt=media&token=230d4707-0bd2-487c-a928-d70176fa1590",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/7.png?alt=media&token=0f5c573d-9023-4fa0-a336-f05ef87c803a",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/8.png?alt=media&token=97cfc859-7670-46b7-80aa-800aa1cc3fc9"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 190.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Collpsing toolbar"),
                background: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/smspad%20app.jpg?alt=media&token=8cefb14c-01d0-4f0d-ac88-7a36f7e24c97",
                  fit: BoxFit.cover,
                ),
              ),
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Add new entry',
                  onPressed: () {/* ... */},
                ),
              ]),
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
                (context, index) => _buildListItems(index),
                childCount: images.length),
          ),
        ],
      ),
    );
  }

  Widget _buildListItems(int index) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Card(
        elevation: 3.0,
        child: ListTile(
          leading: new Hero(
            tag: index,
            child: Image.network(
              images[index],
              height: 100.0,
              width: 100.0,
            ),
          ),
          title: Text("$index Screen shot",
              style: Theme.of(context).textTheme.headline),
          subtitle: Text("Some Descriptio"),
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return Material(
                    color: Colors.black38,
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      child: new InkWell(
                        child: Hero(
                          tag: index,
                          child: Image.network(
                            images[index],
                            height: 300.0,
                            width: 300.0,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                }));
          },
        ),
      ),
    );
  }
}
