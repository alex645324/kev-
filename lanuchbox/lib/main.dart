// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(const StudentSpaceApp());
}

class StudentSpaceApp extends StatelessWidget {
  const StudentSpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Space Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdminDashboardScreen(),
    );
  }
}
