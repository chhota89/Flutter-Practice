import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final listItems = ["Radom Name", "Suman", "Sohel"];

class MaterialDialogListPage extends StatefulWidget {
  @override
  _MaterialDialogListPageState createState() =>
      new _MaterialDialogListPageState();
}

class _MaterialDialogListPageState extends State<MaterialDialogListPage> {
  Widget _dialogBuilder(BuildContext context, String listItem) {
    ThemeData loacalTheme = Theme.of(context);

    return new SimpleDialog(contentPadding: EdgeInsets.zero, children: <Widget>[
      Image.network(
          "http://imgsv.imaging.nikon.com/lineup/lens/zoom/normalzoom/af-s_dx_18-140mmf_35-56g_ed_vr/img/sample/sample1_l.jpg",
          fit: BoxFit.fill),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Kitten Name", style: loacalTheme.textTheme.display1),
            Text("3 Month old",
                style: loacalTheme.textTheme.subhead
                    .copyWith(fontStyle: FontStyle.italic)),
            SizedBox(height: 16.0),
            Text(
                "Call park out she wife face mean. Invitation excellence imprudence understood it continuing to. Ye show done an into. Fifteen winding related may hearted colonel are way studied.",
                style: loacalTheme.textTheme.body1),
            SizedBox(height: 16.0),
            new Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('I\'M ALERGIC'),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text('ADOPT'),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }

  Widget _itemListBuilder(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, listItems[index])),
      child: new Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child:
            Text(listItems[index], style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Dialog"),
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        itemExtent: 60.0,
        itemBuilder: _itemListBuilder,
      ),
    );
  }
}
