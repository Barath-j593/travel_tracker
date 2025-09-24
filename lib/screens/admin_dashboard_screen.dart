import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedPlace = 'Overall';

  final Map<String, Map<String, dynamic>> _placeData = {
    // same as before...
  };

  final List<Map<String, dynamic>> usersData = [
    // same as before...
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final currentData = _placeData[_selectedPlace]!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.adminDashboard)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: loc.searchPlace,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        if (_placeData.containsKey(value)) {
                          setState(() {
                            _selectedPlace = value;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedPlace,
                    items: _placeData.keys.map((String place) {
                      return DropdownMenuItem<String>(
                        value: place,
                        child: Text(place),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPlace = newValue!;
                        _searchController.text = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Selected Place Header
            Row(
              children: [
                Icon(Icons.place, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  loc.statisticsFor(_selectedPlace),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Metrics
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMetricCard(loc.totalUsers, '${currentData['users']}', Icons.people),
                _buildMetricCard(loc.totalTrips, '${currentData['trips']}', Icons.directions),
                _buildMetricCard(loc.avgTripsUser, '${(currentData['trips'] / currentData['users']).toStringAsFixed(1)}', Icons.analytics),
                _buildMetricCard(loc.activeToday, '${(currentData['users'] * 0.7).toInt()}', Icons.trending_up),
              ],
            ),
            SizedBox(height: 24),

            // Transport Mode Share
            Text(loc.transportModeShare(_selectedPlace),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            // same chart code...

            SizedBox(height: 24),

            // Weekly Trip Count
            Text(loc.weeklyTripCount(_selectedPlace),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            // same chart code...

            SizedBox(height: 24),

            // Users by Place
            Text(loc.usersByPlace,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: usersData
                      .where((user) => _selectedPlace == 'Overall' || user['place'] == _selectedPlace)
                      .map((user) => ListTile(
                            leading: CircleAvatar(
                              child: Text(user['name'].toString().split(' ').map((n) => n[0]).join()),
                            ),
                            title: Text(user['name']),
                            subtitle: Text(
                              loc.tripsPoints(user['trips'], user['points']),
                            ),
                            trailing: Chip(
                              label: Text(user['place'], style: TextStyle(color: Colors.white)),
                              backgroundColor: _getPlaceColor(user['place']),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Color _getPlaceColor(String place) {
    switch (place) {
      case 'Chennai':
        return Colors.blue;
      case 'Munnar':
        return Colors.red;
      case 'Bangalore':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
