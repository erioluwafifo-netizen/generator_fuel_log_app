import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const GeneratorFuelApp());
}

class GeneratorFuelApp extends StatelessWidget {
  const GeneratorFuelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generator Fuel Log',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF006064), // Deep Teal
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006064)),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006064),
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}