import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:travel_tracker/screens/register_screen.dart';
import 'package:travel_tracker/utils/constants.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';
import 'package:travel_tracker/providers/locale_provider.dart';

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
        final loc = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(loc.gpsConsentTitle),
          content: Text(
            loc.gpsConsentDescription,
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.ok),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    final loc = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (!_gpsConsent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.gpsConsentRequired)),
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
        SnackBar(content: Text(loc.loginFailed)),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          // Language Dropdown
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: localeProvider.locale,
                items: AppLocalizations.supportedLocales
                    .map((locale) => DropdownMenuItem(
                          value: locale,
                          child: Text(locale.languageCode.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (locale) {
                  if (locale != null) {
                    localeProvider.setLocale(locale);
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
                Text(loc.appTitle, style: kTitleStyle),
                SizedBox(height: 10),
                Text(loc.appSubtitle, style: kSubtitleStyle),
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
                            decoration: InputDecoration(
                              labelText: loc.email,
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) => value?.isEmpty ?? true ? loc.enterEmail : null,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: loc.password,
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            validator: (value) => value?.isEmpty ?? true ? loc.enterPassword : null,
                          ),
                          SizedBox(height: 16),
                          CheckboxListTile(
                            title: GestureDetector(
                              onTap: _showConsentDialog,
                              child: Text(
                                loc.gpsConsentCheckbox,
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
                                  child: Text(loc.login, style: TextStyle(fontSize: 16)),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()),
                            ),
                            child: Text(loc.createAccount),
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
                                Text(loc.demoCredentials, style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('user@example.com / password'),
                                Text('admin@example.com / password (${loc.admin})'),
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
