import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  final companyLogoColor = const Color(0xFF26afc2);
  Widget _buildContactUsRow(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: companyLogoColor),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(fontSize: 15.0, color: companyLogoColor))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(children: <Widget>[
        new Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Image.asset(
          'assets/developer_background.jpg',
          height: 270.0,
          fit: BoxFit.fill,
        ),
        new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text("Developed by"),
            ),
            SizedBox(
              height: 10.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/company_logo.png',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Accucia Softwares",
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text("www.accucia.com",
                style: Theme.of(context).textTheme.body1.copyWith(
                    decoration: TextDecoration.underline,
                    color: companyLogoColor)),
            SizedBox(
              height: 20.0,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Card(
                elevation: 3.0,
                child: new Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                          "We are a full-service software solutions provider, Creating Smart digital products, engineered to drive the growth of your business!\n\nAccucia has steadily been growing and earning the trust of hundreds of businesses globally by providing them with enterprise-grade software solutions and turning their ideas into reality.\n\nWe combine proven methodologies, business domain knowledge and technology expertise of skilled software professionals to deliver high quality solutions."),
                      SizedBox(height: 10.0),
                      Text(
                          "Interested in transforming your business with us?\nLet's get in touch now!",
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildContactUsRow(Icons.call, "Call"),
                        _buildContactUsRow(Icons.email, "Email"),
                        _buildContactUsRow(Icons.whatshot, "WhatsApp"),
                        _buildContactUsRow(Icons.directions, "Direction"),
                      ],
                    ),
                  )),
            )
          ],
        )
      ]),
    );
  }
}
