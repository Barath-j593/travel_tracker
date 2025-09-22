import 'package:flutter/material.dart';
import 'package:travel_tracker/screens/trip_record_screen.dart';
import 'package:travel_tracker/screens/trip_history_screen.dart';
import 'package:travel_tracker/screens/eco_points_screen.dart';
import 'package:travel_tracker/screens/companion_screen.dart';
import 'package:travel_tracker/screens/monthly_summary_screen.dart';
import 'package:travel_tracker/screens/admin_dashboard_screen.dart';
import 'package:travel_tracker/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Start Trip',
      'icon': Icons.directions_car,
      'color': Colors.blue,
      'screen': TripRecordScreen(),
    },
    {
      'title': 'Trip History',
      'icon': Icons.history,
      'color': Colors.purple,
      'screen': TripHistoryScreen(),
    },
    {
      'title': 'Eco Points',
      'icon': Icons.eco,
      'color': Colors.green,
      'screen': EcoPointsScreen(),
    },
    {
      'title': 'Companions',
      'icon': Icons.group,
      'color': Colors.orange,
      'screen': CompanionScreen(),
    },
    {
      'title': 'Monthly Summary',
      'icon': Icons.bar_chart,
      'color': Colors.red,
      'screen': MonthlySummaryScreen(),
    },
    {
      'title': 'Admin Dashboard',
      'icon': Icons.admin_panel_settings,
      'color': Colors.indigo,
      'screen': AdminDashboardScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['screen']),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: item['color']),
                    SizedBox(height: 16),
                    Text(item['title'], style: kCardTitleStyle),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}