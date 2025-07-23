// this model containing all dashborad pie chart data

import 'package:flutter/rendering.dart';

class ChartData {
  const ChartData(this.title, this.number, this.color, this.percent);
  final String title;
  final String number;
  final Color color;
  final double percent;
}

List<ChartData> dashboardData = [
  ChartData("Delivered", "20", Color(0xff239F20), 35),
  ChartData("Pending", "15", Color(0xffFF2C53), 20),
  ChartData("Priced", "30", Color(0xff06463C), 45),
];
