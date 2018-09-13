import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class IplTeamsPage extends StatefulWidget {
  @override
  _IplTeamsState createState() => new _IplTeamsState();
}

class _IplTeamsState extends State<IplTeamsPage> {
  final reference =
      FirebaseDatabase.instance.reference().child('ipl').child('tean_info');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Ipl 2015"),
        ),
        body: new FirebaseAnimatedList(
            query: reference,
            itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
                int position) {
              return IplTeamWidget(team: IplTeamModel.fromSnapshot(snapshot));
            }));
  }
}

class IplTeamModel {
  String name;
  String captain;
  String coach;
  String homeVenue;
  String imgUrl;
  String owner;

  IplTeamModel(
      {this.name,
      this.captain,
      this.coach,
      this.homeVenue,
      this.imgUrl,
      this.owner});

  IplTeamModel.fromSnapshot(DataSnapshot dataSnapshot)
      : name = dataSnapshot.value["team_name"],
        captain = dataSnapshot.value["team_captain"],
        coach = dataSnapshot.value["team_coach"],
        homeVenue = dataSnapshot.value["team_home_venue"],
        imgUrl = dataSnapshot.value["team_img_url"],
        owner = dataSnapshot.value["team_owner"];
}

class IplTeamWidget extends StatelessWidget {
  final IplTeamModel team;
  IplTeamWidget({this.team});

  @override
  Widget build(BuildContext context) {
    return new Text(team.name);
  }
}
