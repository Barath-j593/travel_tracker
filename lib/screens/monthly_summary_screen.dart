import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';

class MonthlySummaryScreen extends StatelessWidget {
  final List<BarChartGroupData> transportData = [
    BarChartGroupData(
      x: 0,
      barRods: [BarChartRodData(toY: 120, color: Colors.red, width: 20, borderRadius: BorderRadius.circular(4))],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [BarChartRodData(toY: 80, color: Colors.blue, width: 20, borderRadius: BorderRadius.circular(4))],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [BarChartRodData(toY: 45, color: Colors.green, width: 20, borderRadius: BorderRadius.circular(4))],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [BarChartRodData(toY: 25, color: Colors.purple, width: 20, borderRadius: BorderRadius.circular(4))],
    ),
  ];

  final List<FlSpot> co2Data = [
    FlSpot(0, 25),
    FlSpot(1, 30),
    FlSpot(2, 45),
    FlSpot(3, 40),
    FlSpot(4, 55),
    FlSpot(5, 60),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.monthlySummaryTitle)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.distanceByTransportMode, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildBarChart(loc),
            SizedBox(height: 32),
            Text(loc.co2Saved, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildLineChart(loc),
            SizedBox(height: 32),
            Text(loc.monthlyStats, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildStatsGrid(loc),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(AppLocalizations loc) {
    final modes = [loc.car, loc.bus, loc.bike, loc.walk];

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
      ),
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(modes[value.toInt()], style: TextStyle(fontSize: 12)),
                ),
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text('${value.toInt()} km'),
                reservedSize: 40,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: transportData,
          gridData: FlGridData(show: true),
          alignment: BarChartAlignment.spaceAround,
          maxY: 140,
        ),
      ),
    );
  }

  Widget _buildLineChart(AppLocalizations loc) {
    final months = [loc.jan, loc.feb, loc.mar, loc.apr, loc.may, loc.jun];

    return Container(
      height: 250,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
      ),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: true),
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(months[value.toInt()]),
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text('${value.toInt()} kg'),
                reservedSize: 40,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: true, border: Border.all(color: Color(0xff37434d), width: 1)),
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 70,
          lineBarsData: [LineChartBarData(spots: co2Data, isCurved: true, color: Colors.green, barWidth: 4, isStrokeCapRound: true, dotData: FlDotData(show: true), belowBarData: BarAreaData(show: true, color: Colors.green.withOpacity(0.3)))],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(AppLocalizations loc) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard(loc.totalDistance, '270 km', Icons.directions),
        _buildStatCard(loc.co2SavedStat, '60 kg', Icons.eco),
        _buildStatCard(loc.tripsTaken, '42', Icons.directions_car),
        _buildStatCard(loc.ecoPoints, '1250', Icons.emoji_events),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.green),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
