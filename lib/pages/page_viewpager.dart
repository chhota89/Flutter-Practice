import 'package:flutter/material.dart';
import 'dart:async';

class MobilePageView extends StatefulWidget {
  @override
  MobilePageViewState createState() {
    return new MobilePageViewState();
  }
}

class MobilePageViewState extends State<MobilePageView> {
  PageController _pageController;
  Timer _timer;

  final List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/1.png?alt=media&token=c3cd271b-6998-422b-9c03-2ff084bd13d4",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/2.png?alt=media&token=8c2acd6f-c457-4164-b7f5-0dd8c4a1fdbb",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/3.png?alt=media&token=ca36ae9d-47e5-4764-b8ce-7da95aad2450",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/4.png?alt=media&token=d87cb108-1c83-4b1a-84de-2f0179043e6b",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/6.png?alt=media&token=230d4707-0bd2-487c-a928-d70176fa1590",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/7.png?alt=media&token=0f5c573d-9023-4fa0-a336-f05ef87c803a",
    "https://firebasestorage.googleapis.com/v0/b/accucia-1eb4e.appspot.com/o/8.png?alt=media&token=97cfc859-7670-46b7-80aa-800aa1cc3fc9"
  ];

  int get actualIndex => _pageController.page?.floor();

  int get nextIndex {
    var nextIndexValue = actualIndex;

    if (nextIndexValue < images.length - 1)
      nextIndexValue++;
    else
      nextIndexValue = 0;

    return nextIndexValue;
  }

  void startAnimating() {
    _timer?.cancel();
    _timer = new Timer.periodic(
        Duration(seconds: 5),
        (_) => _pageController.animateToPage(nextIndex,
            duration: Duration(milliseconds: 250), curve: Curves.easeOut));
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(viewportFraction: 0.7);
    startAnimating();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Center(
            child: SizedBox(
              height: 440.0,
              child: Image.asset('assets/android_frame.png'),
            ),
          ),
          new Center(
            child: SizedBox(
                height: 400.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.contain,
                        ));
                  },
                )),
          ),
        ],
      ),
    );
  }
}
