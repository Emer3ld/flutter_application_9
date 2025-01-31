import 'package:flutter/material.dart';
import 'screens/start_screen.dart'; // Update with your project name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Quality Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      // The first screen to show is StartScreen
      home: const StartScreen(),
    );
  }
}
