import 'package:flutter/material.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _trackingPaused = false;
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  void _checkAdminStatus() {
    final authService = Provider.of<AuthService>(context, listen: false);
    _isAdmin = authService.isAdmin;
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final authService = Provider.of<AuthService>(context, listen: false);
              authService.logout();
            },
            child: Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Account'),
        content: Text('This action cannot be undone. All your data will be permanently deleted.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement delete account logic
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(children: [
                  CircleAvatar(radius: 40, backgroundColor: kPrimaryColor, child: Icon(Icons.person, size: 40, color: Colors.white)),
                  SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('john.doe@example.com', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Chip(label: Text(_isAdmin ? 'Admin' : 'User'), backgroundColor: _isAdmin ? Colors.orange : Colors.blue, labelStyle: TextStyle(color: Colors.white)),
                  ])),
                ]),
              ),
            ),
            SizedBox(height: 24),

            Text('Travel Statistics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildStatCard('Total Trips', '45', Icons.directions),
                _buildStatCard('Total Distance', '120 km', Icons.place),
                _buildStatCard('Frequent Mode', 'Bus', Icons.directions_bus),
                _buildStatCard('Eco Points', '1250', Icons.eco),
              ],
            ),
            SizedBox(height: 24),

            Text('Privacy Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                SwitchListTile(
                  title: Text('Pause Tracking'),
                  subtitle: Text('Temporarily stop collecting travel data'),
                  value: _trackingPaused,
                  onChanged: (value) => setState(() => _trackingPaused = value),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Update Consent'),
                  subtitle: Text('Review and update data collection consent'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Data Collection Consent'),
                      content: Text('We collect anonymous travel data to improve urban planning and promote sustainable transportation. Your data is anonymized and secure.'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('I Understand'))],
                    ),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Delete Account', style: TextStyle(color: Colors.red)),
                  subtitle: Text('Permanently delete your account and all data'),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
                  onTap: _deleteAccount,
                ),
              ]),
            ),

            if (_isAdmin) ...[
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.admin_panel_settings),
                label: Text('Open Admin Dashboard'),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.orange),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 30, color: kPrimaryColor),
          SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
      ),
    );
  }
}