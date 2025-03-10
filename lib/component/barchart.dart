import 'package:ddas/util/chartdata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  final List<ChartData> data;
  final TooltipBehavior tooltip;
  BarChart({super.key, required this.data, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(
          minimum: 0,
          maximum: 40,
          interval: 5,
          isVisible: false,
        ),
        tooltipBehavior: tooltip,
        series: <CartesianSeries>[
          StackedBarSeries<ChartData, String>(
              groupName: 'Group A',
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1),
          StackedBarSeries<ChartData, String>(
              groupName: 'Group B',
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2),
        ],
      ),
    );
  }
}
