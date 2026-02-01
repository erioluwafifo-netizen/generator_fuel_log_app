import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'splash_screen.dart';
import '../widgets/app_drawer.dart';
import 'package:generator_fuel_log_app/services/globals.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalQty = globalFuelLogs.fold(0, (sum, item) => sum + item.quantity);
    double totalCost = globalFuelLogs.fold(0, (sum, item) => sum + item.cost);

    return Scaffold(
      appBar: AppBar(title: const Text('Trends & Summary')),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Consumption Trend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Requirement: "Show trends with charts"
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: globalFuelLogs.asMap().entries.map((e) {
                    return BarChartGroupData(x: e.key, barRods: [
                      BarChartRodData(toY: e.value.quantity, color: const Color(0xFF006064), width: 15)
                    ]);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _statCard("Total Fuel", "${totalQty.toStringAsFixed(1)} L"),
            const SizedBox(height: 15),
            _statCard("Total Cost", "₦${totalCost.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String val) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(color: const Color(0xFF006064), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(val, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}