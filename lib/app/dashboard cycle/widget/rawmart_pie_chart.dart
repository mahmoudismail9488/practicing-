import 'package:flutter/material.dart';
import 'package:new_app/app/dashboard%20cycle/models/chart_data.dart';
import 'package:fl_chart/fl_chart.dart';

class RawmartPieChart extends StatefulWidget {
  const RawmartPieChart({super.key});

  @override
  State<RawmartPieChart> createState() => _RawmartPieChartState();
}

class _RawmartPieChartState extends State<RawmartPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: dashboardData
            .map(
              (ele) =>
                  PieChartSectionData(value: ele.percent, color: ele.color),
            )
            .toList(),
        sectionsSpace: 8,
      ),
    );
  }
}
