import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/fuel_log.dart';
import '../widgets/app_drawer.dart';
import 'package:generator_fuel_log_app/services/globals.dart';

class AddLogScreen extends StatefulWidget {
  const AddLogScreen({super.key});

  @override
  State<AddLogScreen> createState() => _AddLogScreenState();
}

class _AddLogScreenState extends State<AddLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _qtyController = TextEditingController();
  final _costController = TextEditingController();
  final _notesController = TextEditingController();

  // Integrated helper to save data
  Future<void> _persistData() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      globalFuelLogs.map((log) => log.toJson()).toList(),
    );
    // CRITICAL: Ensure this key matches exactly what is in your SplashScreen load logic
    await prefs.setString('fuel_logs', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Fuel Log')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Purchase Record", 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF006064))),
              const SizedBox(height: 20),
              _inputField(_qtyController, "Quantity (Litres)", Icons.gas_meter, true),
              const SizedBox(height: 15),
              _inputField(_costController, "Cost (₦)", Icons.payments, true),
              const SizedBox(height: 15),
              _inputField(_notesController, "Maintenance/Usage Notes", Icons.note_alt, false, lines: 3),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF006064),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Save Log', style: TextStyle(fontSize: 16)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newLog = FuelLog(
                      quantity: double.parse(_qtyController.text),
                      cost: double.parse(_costController.text),
                      notes: _notesController.text,
                      date: DateTime.now(),
                    );

                    setState(() {
                      globalFuelLogs.add(newLog);
                    });

                    // Save to disk immediately
                    await _persistData();

                    _qtyController.clear();
                    _costController.clear();
                    _notesController.clear();
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Log Saved Successfully')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController ctrl, String label, IconData icon, bool isNum, {int lines = 1}) {
    return TextFormField(
      controller: ctrl,
      maxLines: lines,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF006064)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
    );
  }
}