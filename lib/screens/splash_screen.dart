import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/fuel_log.dart';
import '../services/globals.dart'; 
import 'add_log_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // 1. Get the storage instance
    final prefs = await SharedPreferences.getInstance();
    
    // 2. Read the string data - ensure this key matches AddLogScreen
    final String? savedData = prefs.getString('fuel_logs');
    
    // 3. If data exists, decode it into the global list
    if (savedData != null) {
      final List<dynamic> decodedList = jsonDecode(savedData);
      globalFuelLogs = decodedList.map((item) => FuelLog.fromJson(item)).toList();
    }

    // 4. Wait for the "Tech Feel" branding
    await Future.delayed(const Duration(seconds: 3));

    // 5. Navigate to the Home Screen
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AddLogScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF006064), // Deep Teal
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fixes the compilation error
          children: [
            Icon(Icons.bolt, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'GENERATOR FUEL LOG',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
} // This closing bracket was missing!