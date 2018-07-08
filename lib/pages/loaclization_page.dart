import 'package:flutter/material.dart';
import 'package:flutter_practice/localization/DemoLocalizations.dart';

class LocalizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text(DemoLocalizations.of(context).trans('hello_world')),
      ),
    );
  }
}
