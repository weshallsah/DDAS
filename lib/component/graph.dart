import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Graph extends StatelessWidget {
  Map dataMap;
  Graph({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap as Map<String, double>,
    );
  }
}
