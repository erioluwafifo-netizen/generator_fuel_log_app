import 'dart:convert';

class FuelLog {
  final double quantity;
  final double cost;
  final String notes;
  final DateTime date;

  FuelLog({
    required this.quantity,
    required this.cost,
    required this.notes,
    required this.date,
  });

  // Convert Object to Map for JSON storage
  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'cost': cost,
        'notes': notes,
        'date': date.toIso8601String(),
      };

  // Create Object from JSON map
  factory FuelLog.fromJson(Map<String, dynamic> json) => FuelLog(
        quantity: json['quantity'],
        cost: json['cost'],
        notes: json['notes'],
        date: DateTime.parse(json['date']),
      );
}