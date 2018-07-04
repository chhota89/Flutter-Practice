import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/theme_bloc.dart' as themeBloc;

class ThemeChangePage extends StatelessWidget {
  //TODO learn Inherited widget to don't pass value in constructor
  bool darkThemeEnable;
  ThemeChangePage(this.darkThemeEnable);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Theme")),
      body: Center(
        child: Text("Hello world"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Dark Theme"),
              trailing: Switch(
                  onChanged: (bool value) {
                    themeBloc.bloc.changeTheme(value);
                  },
                  value: darkThemeEnable),
            )
          ],
        ),
      ),
    );
  }
}
