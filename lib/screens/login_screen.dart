import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:travel_tracker/screens/register_screen.dart';
import 'package:travel_tracker/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'user@example.com');
  final _passwordController = TextEditingController(text: 'password');
  bool _isLoading = false;
  bool _gpsConsent = false;

  void _showConsentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('GPS Location Usage Consent'),
          content: Text(
            'Travel Tracker uses your GPS location to enable trip tracking and family safety features. Your location data is securely stored using industry-standard encryption to protect your privacy. We are committed to safeguarding your information and will not share it without your consent.',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_gpsConsent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to GPS location usage to proceed.')),
      );
      return;
    }

    setState(() => _isLoading = true);
    
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.login(
        _emailController.text,
        _passwordController.text,
      );
      // Navigation is handled by AuthWrapper
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.blue.shade50],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(Icons.directions_car, size: 120, color: kPrimaryColor),
                SizedBox(height: 20),
                Text('Travel Tracker', style: kTitleStyle),
                SizedBox(height: 10),
                Text('Track your journeys, earn eco-points', style: kSubtitleStyle),
                SizedBox(height: 30),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                            validator: (value) => value?.isEmpty ?? true ? 'Please enter email' : null,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                            obscureText: true,
                            validator: (value) => value?.isEmpty ?? true ? 'Please enter password' : null,
                          ),
                          SizedBox(height: 16),
                          CheckboxListTile(
                            title: GestureDetector(
                              onTap: _showConsentDialog,
                              child: Text(
                                'I agree to allow Travel Tracker to use my GPS location for trip tracking and family safety features.',
                                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                              ),
                            ),
                            value: _gpsConsent,
                            onChanged: (value) {
                              _showConsentDialog();
                              setState(() => _gpsConsent = value ?? false);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                          SizedBox(height: 24),
                          _isLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: _login,
                                  child: Text('Login', style: TextStyle(fontSize: 16)),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                            child: Text('Create new account'),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text('Demo Credentials:', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('user@example.com / password'),
                                Text('admin@example.com / password (Admin)'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}