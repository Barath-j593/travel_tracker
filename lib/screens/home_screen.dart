import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/services/trip_service.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:travel_tracker/screens/trip_history_screen.dart';
import 'package:travel_tracker/screens/eco_points_screen.dart';
import 'package:travel_tracker/screens/companion_screen.dart';
import 'package:travel_tracker/screens/monthly_summary_screen.dart';
import 'package:travel_tracker/screens/admin_dashboard_screen.dart';
import 'package:travel_tracker/screens/profile_screen.dart';
import 'package:travel_tracker/screens/family_location_screen.dart';
import 'package:travel_tracker/utils/constants.dart';
import 'package:travel_tracker/screens/auto_trip_detection_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> getMenuItems(bool isAdmin) {
    List<Map<String, dynamic>> items = [
      {
        'title': 'Auto Trip Detection',
        'icon': Icons.gps_fixed_rounded,
        'color': Colors.blue,
        'screen': AutoTripDetectionScreen(),
      },
      {
        'title': 'Trip History',
        'icon': Icons.history_rounded,
        'color': Colors.purple,
        'screen': TripHistoryScreen(),
      },
      {
        'title': 'Eco Points',
        'icon': Icons.eco_rounded,
        'color': kPrimaryColor,
        'screen': EcoPointsScreen(),
      },
      {
        'title': 'Family Location',
        'icon': Icons.family_restroom_rounded,
        'color': Colors.orange,
        'screen': FamilyLocationScreen(),
      },
      {
        'title': 'Companions',
        'icon': Icons.group_rounded,
        'color': Colors.blue,
        'screen': CompanionScreen(),
      },
      {
        'title': 'Monthly Summary',
        'icon': Icons.analytics_rounded,
        'color': Colors.red,
        'screen': MonthlySummaryScreen(),
      },
    ];

    // Only add Admin Dashboard for admin users
    if (isAdmin) {
      items.add({
        'title': 'Admin Dashboard',
        'icon': Icons.admin_panel_settings_rounded,
        'color': Colors.indigo,
        'screen': AdminDashboardScreen(),
      });
    }

    return items;
  }

  Widget _buildDashboardCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => item['screen'],
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 0.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: item['color'].withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item['icon'], size: 24, color: item['color']),
                ),
                SizedBox(height: 15),
                Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final isAdmin = authService.isAdmin;
    final menuItems = getMenuItems(isAdmin);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Travel Tracker', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Welcome Header
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor.withOpacity(0.1), kPrimaryColor.withOpacity(0.05)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.directions_car_rounded, size: 30, color: kPrimaryColor),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Travel Tracker',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Automatic trip detection • Eco points • Family safety',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Dashboard Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.dashboard_rounded, color: Colors.grey[600], size: 20),
                SizedBox(width: 8),
                Text(
                  'DASHBOARD',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.0,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return _buildDashboardCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }
}