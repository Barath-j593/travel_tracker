import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminDashboardScreen extends StatelessWidget {
  final List<PieChartSectionData> modeShareData = [
    PieChartSectionData(
      color: Colors.red,
      value: 40,
      title: '40%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.blue,
      value: 30,
      title: '30%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 15,
      title: '15%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.purple,
      value: 10,
      title: '10%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 5,
      title: '5%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

  final List<BarChartGroupData> tripCountData = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 120,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 145,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 130,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 160,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 180,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 90,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 70,
          color: Colors.blue,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel Analytics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Transport Mode Share',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: PieChart(
                PieChartData(
                  sections: modeShareData,
                  centerSpaceRadius: 40,
                  sectionsSpace: 2,
                  startDegreeOffset: 180,
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                _buildLegendItem('Car', Colors.red),
                _buildLegendItem('Bus', Colors.blue),
                _buildLegendItem('Bicycle', Colors.green),
                _buildLegendItem('Walk', Colors.purple),
                _buildLegendItem('Other', Colors.orange),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Daily Trip Count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 250,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
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
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              days[value.toInt()],
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('${value.toInt()}');
                        },
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: tripCountData,
                  gridData: FlGridData(show: true),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 200,
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Key Metrics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMetricCard('Total Users', '1,245', Icons.people),
                _buildMetricCard('Active Today', '895', Icons.trending_up),
                _buildMetricCard('Total Trips', '12,458', Icons.directions),
                _buildMetricCard('Avg. Distance', '8.2 km', Icons.place),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            color: color,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}