// lib/widgets/weekly_busy_hours_chart.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBusyHoursChart extends StatelessWidget {
  WeeklyBusyHoursChart({Key? key}) : super(key: key);

  // Sample data for the week
  final List<_WeeklyData> weeklyData = [
    _WeeklyData(day: 'Mon', hours: 42),
    _WeeklyData(day: 'Tue', hours: 35),
    _WeeklyData(day: 'Wed', hours: 58),
    _WeeklyData(day: 'Thu', hours: 49),
    _WeeklyData(day: 'Fri', hours: 45),
    _WeeklyData(day: 'Sat', hours: 28),
    _WeeklyData(day: 'Sun', hours: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Busy Hours",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  maxY: 70,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return Text(days[value.toInt()], style: const TextStyle(fontSize: 12));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 28),
                    ),
                  ),
                  barGroups: weeklyData.asMap().entries.map((entry) {
                    int index = entry.key;
                    _WeeklyData data = entry.value;
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: data.hours.toDouble(),
                          color: Colors.blueAccent,
                          width: 16,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyData {
  final String day;
  final int hours;
  _WeeklyData({required this.day, required this.hours});
}
