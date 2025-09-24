import 'package:flutter/material.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/utils/constants.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';

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
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.logout),
        content: Text(loc.logoutConfirmation),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final authService = Provider.of<AuthService>(context, listen: false);
              authService.logout();
            },
            child: Text(loc.logout, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _deleteAccount() {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.deleteAccount),
        content: Text(loc.deleteAccountConfirmation),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement delete account logic
            },
            child: Text(loc.delete, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.profile),
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
                  CircleAvatar(
                      radius: 40,
                      backgroundColor: kPrimaryColor,
                      child: Icon(Icons.person, size: 40, color: Colors.white)),
                  SizedBox(width: 16),
                  Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('john.doe@example.com', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Chip(
                        label: Text(_isAdmin ? loc.admin : loc.user),
                        backgroundColor: _isAdmin ? Colors.orange : Colors.blue,
                        labelStyle: TextStyle(color: Colors.white)),
                  ])),
                ]),
              ),
            ),
            SizedBox(height: 24),

            Text(loc.travelStatistics, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildStatCard(loc.totalTrips, '45', Icons.directions),
                _buildStatCard(loc.totalDistance, '120 km', Icons.place),
                _buildStatCard(loc.frequentMode, 'Bus', Icons.directions_bus),
                _buildStatCard(loc.ecoPoints, '1250', Icons.eco),
              ],
            ),
            SizedBox(height: 24),

            Text(loc.privacySettings, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                SwitchListTile(
                  title: Text(loc.pauseTracking),
                  subtitle: Text(loc.pauseTrackingSubtitle),
                  value: _trackingPaused,
                  onChanged: (value) => setState(() => _trackingPaused = value),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text(loc.updateConsent),
                  subtitle: Text(loc.updateConsentSubtitle),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(loc.dataCollectionConsent),
                      content: Text(loc.dataCollectionConsentDescription),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.iUnderstand))],
                    ),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text(loc.deleteAccount, style: TextStyle(color: Colors.red)),
                  subtitle: Text(loc.deleteAccountSubtitle),
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
                label: Text(loc.openAdminDashboard),
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
