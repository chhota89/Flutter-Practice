import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/ipl/ipl_model.dart';
import 'dart:async';

class TeamPlayersPage extends StatefulWidget {
  final IplTeamModel team;
  TeamPlayersPage({this.team});

  @override
  _TeamPlayersPageState createState() => new _TeamPlayersPageState();
}

class _TeamPlayersPageState extends State<TeamPlayersPage> {
  var reference = FirebaseDatabase.instance.reference().child('ipl');
  List<IplPlayer> playerList = new List();
  @override
  void initState() {
    super.initState();

    reference = reference.child(widget.team.name.replaceAll(" ", ""));

    reference.onChildAdded.listen(_onEntryAdded);
    reference.onChildChanged.listen(_onEntryChange);
  }

  void _onEntryAdded(Event event) {
    setState(() {
      playerList.add(IplPlayer.fromSnapshot(event.snapshot));
    });
  }

  void _onEntryChange(Event event) {
    var newTeam = IplPlayer.fromSnapshot(event.snapshot);
    var old = playerList.singleWhere((entry) {
      return entry.name == newTeam.name;
    });

    setState(() {
      playerList[playerList.indexOf(old)] = newTeam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(widget.team.name),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: playerList
                .map((player) => PlayerSortInfoWidget(player: player))
                .toList()));
  }
}

class PlayerSortInfoWidget extends StatefulWidget {
  final IplPlayer player;
  PlayerSortInfoWidget({this.player});

  @override
  PlayerSortInfoWidgetState createState() {
    return new PlayerSortInfoWidgetState();
  }
}

class PlayerSortInfoWidgetState extends State<PlayerSortInfoWidget> {
  var url;

  @override
  void initState() {
    super.initState();
    getDownloadableImageUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        url == null
            ? Container(height: 100.0, width: 100.0)
            : Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(url))),
              ),
        new Text(widget.player.name),
      ],
    );
  }

  getDownloadableImageUrl() async {
    url = await FirebaseStorage.instance
        .ref()
        .child(widget.player.imageUrl)
        .getDownloadURL();

    setState(() {});
  }
}
