import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_practice/pages/ipl/ipl_model.dart';
import 'package:flutter_practice/pages/ipl/team_players.dart';

class IplTeamsPage extends StatefulWidget {
  @override
  _IplTeamsState createState() => new _IplTeamsState();
}

class _IplTeamsState extends State<IplTeamsPage> {
  final reference =
      FirebaseDatabase.instance.reference().child('ipl').child('tean_info');

  List<IplTeamModel> teamsList = List();

  @override
  void initState() {
    super.initState();

    reference.onChildAdded.listen(_onEntryAdded);
    reference.onChildChanged.listen(_onEntryChange);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Ipl 2015"),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children:
                teamsList.map((team) => IplTeamWidget(team: team)).toList()));
  }

  void _onEntryAdded(Event event) {
    setState(() {
      teamsList.add(IplTeamModel.fromSnapshot(event.snapshot));
    });
  }

  void _onEntryChange(Event event) {
    var newTeam = IplTeamModel.fromSnapshot(event.snapshot);
    var old = teamsList.singleWhere((entry) {
      return entry.name == newTeam.name;
    });

    setState(() {
      teamsList[teamsList.indexOf(old)] = newTeam;
    });
  }
}

class IplTeamWidget extends StatelessWidget {
  final IplTeamModel team;
  IplTeamWidget({this.team});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: new Text(team.name),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TeamPlayersPage(team: team)));
        });
  }
}
