import 'package:flutter/material.dart';
import 'package:four_calculator/app/presentation/home/home_screen.dart';
import 'package:four_calculator/injection_container.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}

