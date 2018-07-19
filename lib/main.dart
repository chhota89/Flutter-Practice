import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/localization/DemoLocalizationsDelegate.dart';
import 'package:flutter_practice/pages/butto_samples.dart';
import 'package:flutter_practice/pages/cupertino_ios_theme.dart';
import 'package:flutter_practice/pages/draw_scatch.dart';
import 'package:flutter_practice/pages/graph_page.dart';
import 'package:flutter_practice/pages/inherited_widget_page.dart';
import 'package:flutter_practice/pages/loaclization_page.dart';
import 'package:flutter_practice/pages/moviesearch/movie_search_page.dart';
import 'package:flutter_practice/pages/page_transformation.dart';
import 'package:flutter_practice/pages/page_viewpager.dart';
import 'package:flutter_practice/pages/place_type_page.dart';
import 'package:flutter_practice/pages/accucia_app_home.dart';
import 'package:flutter_practice/pages/animation_flutter_logo.dart';
import 'package:flutter_practice/pages/app_intro.dart';
import 'package:flutter_practice/pages/backdrop_drawer.dart';
import 'package:flutter_practice/pages/bottom_dialog.dart';
import 'package:flutter_practice/pages/bottom_navigation_bar_example.dart';
import 'package:flutter_practice/pages/bottom_nevigation_dialog.dart';
import 'package:flutter_practice/pages/change_theme.dart';
import 'package:flutter_practice/pages/chat_screen.dart';
import 'package:flutter_practice/pages/collpsing_toolbar.dart';
import 'package:flutter_practice/pages/custom_fab_button.dart';
import 'package:flutter_practice/pages/developer_page.dart';
import 'package:flutter_practice/pages/discovery/discovery_sample.dart';
import 'package:flutter_practice/pages/drawer_example.dart';
import 'package:flutter_practice/pages/firestore_serve_page.dart';
import 'package:flutter_practice/pages/first_page.dart';
import 'package:flutter_practice/pages/internet_connectivity.dart';
import 'package:flutter_practice/pages/login_screen.dart';
import 'package:flutter_practice/pages/material_dialog.dart';
import 'package:flutter_practice/pages/near_by_places.dart';
import 'package:flutter_practice/pages/rest_example.dart';
import 'package:flutter_practice/pages/stggered_animation.dart';
import 'package:flutter_practice/pages/whatsapp_home.dart';
import 'package:flutter_practice/pages/bottom_fab_notch.dart';
import 'package:flutter_practice/pages/theme_bloc.dart' as themeBloc;

//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter\_localizations/flutter\_localizations.dart';

var API_KEY = "AIzaSyD46cZZidNyb3So7Ze0dFFLZy1m2MirgbQ";

Future main() async {
//  final FirebaseApp app = await FirebaseApp.configure(
//    name: "Flutter Sample",
//      options: new FirebaseOptions(googleAppID: "flutter-sample-41ca1")
//  );
//  final FirebaseStorage storage = new FirebaseStorage(
//    app: app,
//      app: app, storageBucket: 'gs://flutter-firebase-plugins.appspot.com');

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: themeBloc.bloc.darkThemeEnable,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return new MaterialApp(
            supportedLocales: [
              const Locale('tr', ''),
              const Locale('en', ''),
              const Locale('ja', '')
            ],
            localizationsDelegates: [
              const DemoLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }

              return supportedLocales.first;
            },
            title: "WhatsApp",
            theme: snapshot.data
                ? new ThemeData.dark()
                : new ThemeData(
                    primaryColor: Colors.green,
                    accentColor: Colors.greenAccent,
                    buttonTheme: const ButtonThemeData(
                        textTheme: ButtonTextTheme.primary),
                    buttonColor: Colors.green),

//        home : new RestExample(),
//        home: new DrawerPage(),
//      home: new WhatsAppHome(),
//      home: new LoginPageForm(),
//          home: new PlacesListScreen(),
//        home: new BottomNevigationPage(),
            //popup menu, dialog, bottom nevigation
//          home: new MaterialPage(),
//      home: new ChatScreen(),
//        home: new ConnectivityPage(),
//        home:new CustomFabPage()
//      home: new MaterialDialogListPage(),
//          home: new FirestoreServePage(),
//      home: new DeveloperPage(),
//      home: new AnimationFlutterLogoPage(),
//        home: new AccuciaHome(),
//        home: new CollpsingToolbarPage(),
//      home: new BackDropPage(),
//        home: new PageSelectorDemo(),
//        home: new FeatureDiscoveryPage(),
//        home: new BottomDialogPage();
//            home: new ThemeChangePage(snapshot.data),
//          home: new StaggeredAnimationPage(),
//          home: new ScatchDrawPage(),
//            home: new CupertinoPage()
//            home: BottomAppBarPage()
//          home: new LocalizationPage(),
//            home: new MobilePageView(),
//            home: new PlaceTypePage(),
//          home: new InheritedWidgetPageExample(),
//            home: new ButtonSamplePage(),
//          home: new MovieSearchPage(),
//            home: new GraphPage());
            home: new PageTransformationExample());
      },
    );
  }
}
