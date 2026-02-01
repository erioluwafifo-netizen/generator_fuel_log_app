import 'package:flutter/material.dart';
import 'splash_screen.dart'; // To access globalFuelLogs
import '../widgets/app_drawer.dart';
import 'package:intl/intl.dart';
import 'package:generator_fuel_log_app/services/globals.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedMonth = 'All';

  @override
  Widget build(BuildContext context) {
    // Requirement: "History filtering by month"
    final filteredLogs = selectedMonth == 'All' 
        ? globalFuelLogs 
        : globalFuelLogs.where((log) => DateFormat('MMMM').format(log.date) == selectedMonth).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel History'),
        actions: [
          DropdownButton<String>(
            dropdownColor: const Color(0xFF006064),
            value: selectedMonth,
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            icon: const Icon(Icons.filter_list, color: Colors.white),
            items: <String>['All', 'January', 'February', 'March', 'April'] // Add more months as needed
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (val) => setState(() => selectedMonth = val!),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: filteredLogs.isEmpty
          ? const Center(child: Text('No logs found for this period.'))
          : ListView.builder(
              itemCount: filteredLogs.length,
              itemBuilder: (context, index) {
                final log = filteredLogs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Color(0xFF006064)),
                    title: Text('${log.quantity}L - ₦${log.cost}'),
                    subtitle: Text(log.notes),
                    trailing: Text(DateFormat('dd MMM yyyy').format(log.date)),
                  ),
                );
              },
            ),
    );
  }
}