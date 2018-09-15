import 'package:firebase_database/firebase_database.dart';

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

class IplPlayer {
  String destinationFolder;
  String battingStyle;
  String bowlingStyle;
  String dob;
  String imageUrl;
  String name;
  String nationality;
  String role;

  IplPlayer();

  IplPlayer.fromSnapshot(DataSnapshot dataSnapshot)
    : destinationFolder = dataSnapshot.value["destination_folder_name"],
        battingStyle = dataSnapshot.value["player_batting_style"],
        bowlingStyle =dataSnapshot.value["player_bowling_style"],
        dob = dataSnapshot.value["player_dob"],
        imageUrl = dataSnapshot.value["player_img_url"],
        name = dataSnapshot.value["player_name"],
        nationality = dataSnapshot.value["player_nationality"],
        role = dataSnapshot.value["player_role"];
}
