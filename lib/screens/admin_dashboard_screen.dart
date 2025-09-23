import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedPlace = 'Overall';
  
  final Map<String, Map<String, dynamic>> _placeData = {
    'Overall': {
      'users': 1245,
      'trips': 12458,
      'modeShare': [
        PieChartSectionData(value: 40, color: Colors.red, title: '40%'),
        PieChartSectionData(value: 30, color: Colors.blue, title: '30%'),
        PieChartSectionData(value: 15, color: Colors.green, title: '15%'),
        PieChartSectionData(value: 10, color: Colors.purple, title: '10%'),
        PieChartSectionData(value: 5, color: Colors.orange, title: '5%'),
      ],
      'tripCount': [120, 145, 130, 160, 180, 90, 70],
    },
    'Chennai': {
      'users': 345,
      'trips': 3250,
      'modeShare': [
        PieChartSectionData(value: 35, color: Colors.red, title: '35%'),
        PieChartSectionData(value: 40, color: Colors.blue, title: '40%'),
        PieChartSectionData(value: 10, color: Colors.green, title: '10%'),
        PieChartSectionData(value: 10, color: Colors.purple, title: '10%'),
        PieChartSectionData(value: 5, color: Colors.orange, title: '5%'),
      ],
      'tripCount': [80, 95, 110, 120, 130, 70, 50],
    },
    'Munnar': {
      'users': 289,
      'trips': 2780,
      'modeShare': [
        PieChartSectionData(value: 25, color: Colors.red, title: '25%'),
        PieChartSectionData(value: 45, color: Colors.blue, title: '45%'),
        PieChartSectionData(value: 15, color: Colors.green, title: '15%'),
        PieChartSectionData(value: 10, color: Colors.purple, title: '10%'),
        PieChartSectionData(value: 5, color: Colors.orange, title: '5%'),
      ],
      'tripCount': [70, 85, 90, 110, 95, 60, 40],
    },
    'Bangalore': {
      'users': 412,
      'trips': 3980,
      'modeShare': [
        PieChartSectionData(value: 20, color: Colors.red, title: '20%'),
        PieChartSectionData(value: 50, color: Colors.blue, title: '50%'),
        PieChartSectionData(value: 20, color: Colors.green, title: '20%'),
        PieChartSectionData(value: 5, color: Colors.purple, title: '5%'),
        PieChartSectionData(value: 5, color: Colors.orange, title: '5%'),
      ],
      'tripCount': [90, 110, 105, 140, 160, 80, 65],
    },
  };

  final List<Map<String, dynamic>> usersData = [
    {'name': 'John Doe', 'trips': 45, 'points': 1250, 'place': 'Chennai'},
    {'name': 'Jane Smith', 'trips': 32, 'points': 980, 'place': 'Munnar'},
    {'name': 'Robert Johnson', 'trips': 28, 'points': 850, 'place': 'Bangalore'},
    {'name': 'Sarah Wilson', 'trips': 51, 'points': 1450, 'place': 'Chennai'},
    {'name': 'Mike Brown', 'trips': 23, 'points': 720, 'place': 'Overall'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentData = _placeData[_selectedPlace]!;
    
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
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
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a place...',
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
                  'Statistics for: $_selectedPlace',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Key Metrics for Selected Place
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMetricCard('Total Users', '${currentData['users']}', Icons.people),
                _buildMetricCard('Total Trips', '${currentData['trips']}', Icons.directions),
                _buildMetricCard('Avg. Trips/User', '${(currentData['trips'] / currentData['users']).toStringAsFixed(1)}', Icons.analytics),
                _buildMetricCard('Active Today', '${(currentData['users'] * 0.7).toInt()}', Icons.trending_up),
              ],
            ),
            SizedBox(height: 24),

            // Transport Mode Share for Selected Place
            Text('Transport Mode Share - $_selectedPlace', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Container(
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: PieChart(
                PieChartData(
                  sections: currentData['modeShare'],
                  centerSpaceRadius: 40,
                  sectionsSpace: 2,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Weekly Trip Count for Selected Place
            Text('Weekly Trip Count - $_selectedPlace', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Container(
              height: 250,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(days[value.toInt()], style: TextStyle(fontSize: 12)),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text('${value.toInt()}'),
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(7, (index) => BarChartGroupData(
                    x: index,
                    barRods: [BarChartRodData(
                      toY: currentData['tripCount'][index].toDouble(),
                      color: Colors.blue,
                      width: 15,
                    )],
                  )),
                  gridData: FlGridData(show: true),
                  maxY: 200,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Users by Place
            Text('Users by Place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    subtitle: Text('${user['trips']} trips • ${user['points']} points'),
                    trailing: Chip(
                      label: Text(user['place'], style: TextStyle(color: Colors.white)),
                      backgroundColor: _getPlaceColor(user['place']),
                    ),
                  )).toList(),
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
      case 'Chennai': return Colors.blue;
      case 'Munnar': return Colors.red;
      case 'Bangalore': return Colors.green;
      default: return Colors.grey;
    }
  }
}