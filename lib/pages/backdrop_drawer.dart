import 'package:flutter/material.dart';

class BackDropPage extends StatefulWidget {
  @override
  _BackDropPageState createState() => new _BackDropPageState();
}

class _BackDropPageState extends State<BackDropPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, value: 1.0, duration: new Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text("Back Drop New Drawer"),
        leading: IconButton(
          icon: AnimatedIcon(
            progress: animationController.view,
            icon: AnimatedIcons.close_menu,
          ),
          onPressed: () {
            animationController.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
        ),
      ),
      body: TwoPanel(controller: animationController),
    );
  }
}

class TwoPanel extends StatefulWidget {
  final AnimationController controller;

  TwoPanel({this.controller});

  @override
  _TwoPanelState createState() => new _TwoPanelState();
}

class _TwoPanelState extends State<TwoPanel> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraint) {
    final height = constraint.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
            begin: new RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(new CurvedAnimation(
            parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanel(BuildContext context, BoxConstraints constraint) {
    final ThemeData themeData = Theme.of(context);

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: themeData.primaryColor,
            child: new Center(
              child: Text("Back Panel",
                  style: TextStyle(fontSize: 24.0, color: Colors.white)),
            ),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraint),
            child: new Material(
              elevation: 12.0,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: header_height,
                    child: new Center(
                      child: Text("Shop Here",
                          style: Theme.of(context).textTheme.button),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Front Panel"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: bothPanel);
  }
}
