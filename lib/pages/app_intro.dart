import 'package:flutter/material.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector({this.icons});

  final List<Icon> icons;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller
          .animateTo((controller.index + delta).clamp(0, icons.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new IconTheme(
              data: new IconThemeData(
                size: 128.0,
                color: color,
              ),
              child: new TabBarView(
                  children: icons.map((Icon icon) {
                return new Container(
                  padding: const EdgeInsets.all(12.0),
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: new Card(
                      elevation: 3.0,
                      child: new Center(
                        child: icon,
                      ),
                    ),
                  ),
                );
              }).toList()),
            ),
          ),
          new Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: new Row(children: <Widget>[
                new IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, -1);
                    },
                    tooltip: 'Page back'),
                new TabPageSelector(
                    controller: controller,
                    indicatorSize: 10.0,
                    selectedColor: Colors.purple),
                new IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, 1);
                    },
                    tooltip: 'Page forward')
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        ],
      ),
    );
  }
}

class PageSelectorDemo extends StatelessWidget {
  static const String routeName = '/material/page-selector';
  static final List<Icon> icons = <Icon>[
    const Icon(Icons.event, semanticLabel: 'Event'),
    const Icon(Icons.home, semanticLabel: 'Home'),
    const Icon(Icons.android, semanticLabel: 'Android'),
    const Icon(Icons.alarm, semanticLabel: 'Alarm'),
    const Icon(Icons.face, semanticLabel: 'Face'),
    const Icon(Icons.language, semanticLabel: 'Language'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DefaultTabController(
        length: icons.length,
        child: new _PageSelector(icons: icons),
      ),
    );
  }
}
