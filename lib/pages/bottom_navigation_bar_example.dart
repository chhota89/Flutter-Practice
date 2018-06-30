import 'package:flutter/material.dart';
class BottomNevigationPage extends StatefulWidget {
  @override
  _BottomNevigationPageState createState() => new _BottomNevigationPageState();
}

class _BottomNevigationPageState extends State<BottomNevigationPage> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: <Widget>[
          new Container(color: Colors.redAccent),
          new Container(color: Colors.blueAccent),
          new Container(color: Colors.greenAccent)
        ],
        controller: _pageController,
        onPageChanged: pageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Traders")),
            new BottomNavigationBarItem(icon: new Icon(Icons.location_on), title: new Text("Places")),
            new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text("Profile"))
          ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void pageChanged(int page){
    setState(() {
      this._page = page;
    });
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page){

    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }


  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
