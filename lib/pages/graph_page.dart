import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

var data = [
  new ClicksPerYear('2016', 12, Colors.red),
  new ClicksPerYear('2017', 42, Colors.yellow),
  new ClicksPerYear('2018', 88, Colors.green),
];

//pie chart
var series = [
  new charts.Series(
    id: 'Clicks',
    domainFn: (ClicksPerYear clickData, _) => clickData.year,
    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    colorFn: (ClicksPerYear clickData, _) => clickData.color,
    data: data,
  ),
];

//List<common.Series> line = [
//  new charts.Series(
//    id: 'Clicks',
//    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//    domainFn: (ClicksPerYear sales, _) => sales.year,
//    measureFn: (ClicksPerYear sales, _) => sales.clicks,
//    data: data,
//  ),
//];

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Graph"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: SizedBox(
          height: 200.0,
          child: new charts.BarChart(series, animate: true),
//          child: new charts.LineChart(
//            line,
//            animate: false,
//            defaultRenderer: new charts.LineRendererConfig()),
//          ),
        ),
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
