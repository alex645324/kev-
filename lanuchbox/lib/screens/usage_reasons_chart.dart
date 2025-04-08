// lib/widgets/usage_reasons_chart.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UsageReasonsChart extends StatelessWidget {
  UsageReasonsChart({Key? key}) : super(key: key);

  // Sample data for usage reasons
  final List<_UsageData> usageData = [
    _UsageData(name: 'Studying', value: 42, color: Colors.blue),
    _UsageData(name: 'Group Projects', value: 28, color: Colors.deepPurple),
    _UsageData(name: 'Meetings', value: 15, color: Colors.pinkAccent),
    _UsageData(name: 'Relaxing', value: 10, color: Colors.lightBlue),
    _UsageData(name: 'Just Exploring', value: 5, color: Colors.amber),
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
              "Usage Reasons",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: usageData.map((data) {
                    return PieChartSectionData(
                      value: data.value.toDouble(),
                      color: data.color,
                      title: "${data.name}\n${data.value}%",
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Simple legend
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: usageData.map((data) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      color: data.color,
                    ),
                    const SizedBox(width: 4),
                    Text(data.name, style: const TextStyle(fontSize: 12)),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class _UsageData {
  final String name;
  final int value;
  final Color color;
  _UsageData({required this.name, required this.value, required this.color});
}
