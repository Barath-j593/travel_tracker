import 'package:flutter/material.dart';
import 'package:travel_tracker/utils/constants.dart';

class EcoPointsScreen extends StatelessWidget {
  final int totalPoints = 1250;
  final int level = 3;
  final String levelName = "Eco Warrior";
  final int nextLevelPoints = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eco Points')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'Total Eco Points',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      totalPoints.toString(),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: (totalPoints % 1000) / 1000,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${totalPoints % 1000}/1000 to next level',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Current Level',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.emoji_events, size: 40, color: Colors.amber),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          levelName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Level $level',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Badges & Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildBadge('Eco Starter', Icons.eco, true),
                _buildBadge('Bus Commuter', Icons.directions_bus, true),
                _buildBadge('Bike Enthusiast', Icons.pedal_bike, false),
                _buildBadge('Weekly Challenge', Icons.emoji_events, true),
                _buildBadge('Monthly Goal', Icons.star, false),
                _buildBadge('Carbon Saver', Icons.forest, true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String title, IconData icon, bool achieved) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: achieved ? kPrimaryColor : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: achieved ? Colors.white : Colors.grey[500],
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: achieved ? Colors.black : Colors.grey[500],
          ),
        ),
      ],
    );
  }
}