import 'package:flutter/material.dart';
import '../screens/add_log_screen.dart';
import '../screens/summary_screen.dart';
import '../screens/history_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF006064)),
            child: Center(child: Icon(Icons.bolt, color: Colors.white, size: 60)),
          ),
          _item(context, Icons.add, "Add Log", const AddLogScreen()),
          _item(context, Icons.history, "History", const HistoryScreen()),
          _item(context, Icons.analytics, "Summary & Trends", const SummaryScreen()),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String txt, Widget page) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF006064)),
      title: Text(txt),
      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}