import 'package:flutter/material.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';
import 'package:travel_tracker/utils/constants.dart';

class FamilyLocationScreen extends StatefulWidget {
  @override
  _FamilyLocationScreenState createState() => _FamilyLocationScreenState();
}

class _FamilyLocationScreenState extends State<FamilyLocationScreen> {
  final List<Map<String, dynamic>> familyMembers = [
    {
      'name': 'Sarah Wilson',
      'relation': 'wife',
      'location': 'Office - Downtown',
      'distance': '2.5 km away',
      'status': 'online',
      'lastSeen': '5 min ago',
      'color': Colors.blue,
      'icon': Icons.female_rounded,
    },
    {
      'name': 'Mike Wilson',
      'relation': 'son',
      'location': 'School - City Center',
      'distance': '5.2 km away',
      'status': 'online',
      'lastSeen': '15 min ago',
      'color': Colors.green,
      'icon': Icons.child_care_rounded,
    },
    {
      'name': 'Emma Wilson',
      'relation': 'daughter',
      'location': 'University Campus',
      'distance': '8.7 km away',
      'status': 'offline',
      'lastSeen': '2 hours ago',
      'color': Colors.purple,
      'icon': Icons.school_rounded,
    },
    {
      'name': 'Robert Wilson',
      'relation': 'father',
      'location': 'Home - Suburban Area',
      'distance': '12.3 km away',
      'status': 'online',
      'lastSeen': '30 min ago',
      'color': Colors.orange,
      'icon': Icons.elderly_rounded,
    },
  ];

  String _getRelationText(String relation, AppLocalizations loc) {
    switch (relation) {
      case 'wife':
        return loc.relationWife;
      case 'son':
        return loc.relationSon;
      case 'daughter':
        return loc.relationDaughter;
      case 'father':
        return loc.relationFather;
      default:
        return relation;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    int onlineCount =
        familyMembers.where((member) => member['status'] == 'online').length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(loc.familyLocationTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loc.locationsUpdated),
                  backgroundColor: kPrimaryColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Card
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.8)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child:
                      Icon(Icons.family_restroom_rounded, size: 30, color: Colors.white),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.familySafetyTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        loc.familySafetySubtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Map Preview
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[50],
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1571494146906-86de15d3817b?w=400'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_rounded, size: 40, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      loc.familyMapViewTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      loc.familyMapViewSubtitle(onlineCount),
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Family Members List Header
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.group_rounded, color: Colors.grey[600], size: 20),
                SizedBox(width: 8),
                Text(
                  loc.familyMembersHeader,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                Spacer(),
                Text(
                  '${onlineCount} ${loc.onlineLabel}',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Family Members List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: familyMembers.length,
              itemBuilder: (context, index) {
                final member = familyMembers[index];
                return _buildFamilyMemberCard(member, loc);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyMemberCard(Map<String, dynamic> member, AppLocalizations loc) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: member['color'].withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(member['icon'], color: member['color']),
        ),
        title: Row(
          children: [
            Text(
              member['name'],
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: member['status'] == 'online'
                    ? Colors.green.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _getRelationText(member['relation'], loc),
                style: TextStyle(
                  fontSize: 10,
                  color: member['status'] == 'online' ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(member['location']),
            SizedBox(height: 2),
            Text(
              member['distance'],
              style: TextStyle(color: kPrimaryColor, fontSize: 12),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: member['status'] == 'online' ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Text(
              member['lastSeen'],
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
