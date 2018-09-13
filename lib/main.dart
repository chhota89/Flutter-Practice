import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/localization/DemoLocalizationsDelegate.dart';
import 'package:flutter_practice/pages/butto_samples.dart';
import 'package:flutter_practice/pages/cupertino_ios_theme.dart';
import 'package:flutter_practice/pages/draw_scatch.dart';
import 'package:flutter_practice/pages/graph_page.dart';
import 'package:flutter_practice/pages/home_page.dart';
import 'package:flutter_practice/pages/inherited_widget_page.dart';
import 'package:flutter_practice/pages/ipl/ipl_teams.dart';
import 'package:flutter_practice/pages/loaclization_page.dart';
import 'package:flutter_practice/pages/moviesearch/movie_search_page.dart';
import 'package:flutter_practice/pages/page_transformation.dart';
import 'package:flutter_practice/pages/page_viewpager.dart';
import 'package:flutter_practice/pages/place_details_screen.dart';
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
import 'package:flutter_practice/pages/pokemon/pokemo_home.dart';
import 'package:flutter_practice/pages/rest_example.dart';
import 'package:flutter_practice/pages/stggered_animation.dart';
import 'package:flutter_practice/pages/whatsapp_home.dart';
import 'package:flutter_practice/pages/bottom_fab_notch.dart';
import 'package:flutter_practice/pages/theme_bloc.dart' as themeBloc;
import 'package:map_view/map_view.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter\_localizations/flutter\_localizations.dart';

class Constants {
  static String apiKey = "AIzaSyAYutNp_I3wpFvLJv8AyI-3cqoGEeMZ4OQ";
  static String mapPhotoUrl =
      "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=";
}

Future main() async {
//  final FirebaseApp app = await FirebaseApp.configure(
//      name: "Flutter Sample",
//      options: new FirebaseOptions(googleAppID: "flutter-sample-41ca1"));
  MapView.setApiKey(Constants.apiKey);
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
            title: "Flutter demo",
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => new HomePage(),
              '/rest_api': (BuildContext context) => new RestExample(),
              '/drawer': (BuildContext context) => new DrawerPage(),
              '/whatsapp_home': (BuildContext context) => new WhatsAppHome(),
              '/login': (BuildContext context) => new LoginPageForm(),
              '/place_list_screen': (BuildContext context) =>
                  new PlacesListScreenPage(),
              '/bottom_nevigation': (BuildContext context) =>
                  new BottomNevigationPage(),
              '/material_page': (BuildContext context) => new MaterialPage(),
              '/chat_screen': (BuildContext context) => new ChatScreen(),
              '/connectivity': (BuildContext context) => new ConnectivityPage(),
              '/custom_fab': (BuildContext context) => new CustomFabPage(),
              '/material_dialog': (BuildContext context) =>
                  new MaterialDialogListPage(),
              '/firestore': (BuildContext context) => new FirestoreServePage(),
              '/developer_page': (BuildContext context) => new DeveloperPage(),
              '/logo_animation': (BuildContext context) =>
                  new AnimationFlutterLogoPage(),
              '/accucia_home': (BuildContext context) => new AccuciaHome(),
              '/collpsing_toolbar': (BuildContext context) =>
                  new CollpsingToolbarPage(),
              '/back_drop': (BuildContext context) => new BackDropPage(),
              '/page_selector': (BuildContext context) =>
                  new PageSelectorDemo(),
              '/feature_discovery': (BuildContext context) =>
                  new FeatureDiscoveryPage(),
              '/bottom_dialog': (BuildContext context) =>
                  new BottomDialogPage(),
              '/theme_change': (BuildContext context) =>
                  new ThemeChangePage(true),
              '/staggered_animation': (BuildContext context) =>
                  new StaggeredAnimationPage(),
              '/scatch_draw_page': (BuildContext context) =>
                  new ScatchDrawPage(),
              '/cupertino_page': (BuildContext context) => new CupertinoPage(),
              '/bottom_bar_page': (BuildContext context) =>
                  new BottomAppBarPage(),
              '/localization_page': (BuildContext context) =>
                  new LocalizationPage(),
              '/mobile_page_view': (BuildContext context) =>
                  new MobilePageView(),
              '/place_type_page': (BuildContext context) => new PlaceTypePage(),
              '/inherited_widget_page': (BuildContext context) =>
                  new InheritedWidgetPageExample(),
              '/button_samples': (BuildContext context) =>
                  new ButtonSamplePage(),
              '/movie_search': (BuildContext context) => new MovieSearchPage(),
              '/graph_page': (BuildContext context) => new GraphPage(),
              '/page_transform': (BuildContext context) =>
                  new PageTransformationExample(),
              '/pokemon': (BuildContext context) => new PokemonHomePage(),
              '/ipl': (BuildContext context) => new IplTeamsPage()
            },
            theme: snapshot.data
                ? new ThemeData.dark()
                : new ThemeData(
                    primaryColor: Colors.green,
                    accentColor: Colors.greenAccent,
                    buttonTheme: const ButtonThemeData(
                        textTheme: ButtonTextTheme.primary),
                    buttonColor: Colors.green),
            home: new HomePage());
      },
    );
  }
}
