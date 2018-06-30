import 'dart:async';

import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:whatsapp_clone/pages/accucia_app_home.dart';
import 'package:whatsapp_clone/pages/animation_flutter_logo.dart';
import 'package:whatsapp_clone/pages/bottom_navigation_bar_example.dart';
import 'package:whatsapp_clone/pages/bottom_nevigation_dialog.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/collpsing_toolbar.dart';
import 'package:whatsapp_clone/pages/custom_fab_button.dart';
import 'package:whatsapp_clone/pages/developer_page.dart';
import 'package:whatsapp_clone/pages/drawer_example.dart';
import 'package:whatsapp_clone/pages/firestore_serve_page.dart';
import 'package:whatsapp_clone/pages/first_page.dart';
import 'package:whatsapp_clone/pages/internet_connectivity.dart';
import 'package:whatsapp_clone/pages/login_screen.dart';
import 'package:whatsapp_clone/pages/material_dialog.dart';
import 'package:whatsapp_clone/pages/near_by_places.dart';
import 'package:whatsapp_clone/pages/rest_example.dart';
import 'package:whatsapp_clone/pages/whatsapp_home.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_storage/firebase_storage.dart';

var API_KEY = "AIzaSyD46cZZidNyb3So7Ze0dFFLZy1m2MirgbQ";

Future main() async {
//  final FirebaseApp app = await FirebaseApp.configure(
//    name: "Flutter Sample",
//      options: new FirebaseOptions(googleAppID: "flutter-sample-41ca1")
//  );
//  final FirebaseStorage storage = new FirebaseStorage(
//    app: app,
//      app: app, storageBucket: 'gs://flutter-firebase-plugins.appspot.com');

  MapView.setApiKey(API_KEY);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          buttonColor: Colors.green),

//        home : new RestExample(),
//        home: new DrawerPage(),
//      home: new WhatsAppHome(),
//      home: new LoginPageForm(),
//        home: new PlacesListScreen(),
//        home: new BottomNevigationPage(),
      //popup menu, dialog, bottom nevigation
//          home: new MaterialPage(),
//      home: new ChatScreen(),
//        home: new ConnectivityPage(),
//        home:new CustomFabPage()
//      home: new MaterialDialogListPage(),
//      home: new FirestoreServePage(),
//      home: new DeveloperPage(),
//      home: new AnimationFlutterLogoPage(),
//        home: new AccuciaHome(),
        home: new CollpsingToolbarPage(),
    );
  }
}
