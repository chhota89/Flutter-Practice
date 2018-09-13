import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    List<HomeMenuModel> homeMenuList = [
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Ipl 2015", id: "/ipl"),
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Rest Api", id: "/rest_api"),
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Drawer page", id: "/drawer"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Whatsapp home",
          id: "/whatsapp_home"),
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Login Page", id: "/login"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Bottom nevigation",
          id: "/bottom_nevigation"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Material page",
          id: "/material_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Chat screen",
          id: "/chat_screen"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Custom Fab",
          id: "/custom_fab"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Material dialog",
          id: "/material_dialog"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Firestrore",
          id: "/firestore"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Developer Page",
          id: "/developer_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Logo animation",
          id: "/logo_animation"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Sample home",
          id: "/accucia_home"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Collapsing toolbar",
          id: "/collpsing_toolbar"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "New Drawer",
          id: "/back_drop"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Page selector demo",
          id: "/page_selector"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Feature Discovery",
          id: "/feature_discovery"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Bottom dialog",
          id: "/bottom_dialog"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Theme Chage",
          id: "/theme_change"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Multi animation",
          id: "/staggered_animation"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Scatch Paint",
          id: "/scatch_draw_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Ios theme",
          id: "/cupertino_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Bottom app bar ",
          id: "/bottom_bar_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Multi language",
          id: "/localization_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Mobile Screen",
          id: "/mobile_page_view"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Place Type",
          id: "/place_type_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Iherited widget",
          id: "/inherited_widget_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Button sample",
          id: "/button_samples"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Movie search",
          id: "/movie_search"),
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Graph", id: "/graph_page"),
      HomeMenuModel(
          icon: "assets/company_logo.png",
          name: "Page transformation",
          id: "/page_transform"),
      HomeMenuModel(
          icon: "assets/company_logo.png", name: "Pokemon App", id: "/pokemon")
    ];

    return new Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sample"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(2.0),
          children: homeMenuList.map((HomeMenuModel homeMenu) {
            return InkWell(
              child: Card(
                elevation: 2.0,
                child: ListTile(
                  title: Center(
                      child: Text(homeMenu.name,
                          style: TextStyle(fontSize: 24.0))),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(homeMenu.id);
              },
            );
          }).toList(),
        ));
  }
}

class HomeMenuModel {
  String id;
  String icon;
  String name;

  HomeMenuModel({this.id, this.icon, this.name});
}
