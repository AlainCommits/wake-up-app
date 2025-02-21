import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WakeUpApp());
}

class WakeUpApp extends StatelessWidget {
  const WakeUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wake Up Call',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}