import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), title: Text("Shop"))
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return CupertinoPageOne();

                case 1:
                  return CupertioPageTwo();

                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}

class CupertinoPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Home'),
            leading: Icon(CupertinoIcons.book),
          ),
          SliverPadding(
            padding: MediaQuery
                .of(context)
                .removePadding(
                  removeTop: true,
                  removeLeft: true,
                  removeRight: true,
                )
                .padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(5.0),
                      color: index % 2 == 0 ? Colors.yellow : Colors.blue,
                      child: Center(
                        child: Text(index.toString()),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CupertioPageTwo extends StatefulWidget {
  @override
  _CupertioPageTwoState createState() => new _CupertioPageTwoState();
}

class _CupertioPageTwoState extends State<CupertioPageTwo> {
  double _value = 50.0;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Let's Shop"),
      ),
      child: Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CupertinoButton(
                child: Text("Button"),
                onPressed: () {},
                color: Colors.indigo,
              ),
              CupertinoSlider(
                value: _value,
                min: 0.0,
                max: 100.0,
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
                activeColor: Colors.orange,
              ),
              CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() => _switchValue = value);
                },
              ),
              Text(
                'This is Themed Text',
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
