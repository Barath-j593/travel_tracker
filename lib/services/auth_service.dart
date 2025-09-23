import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_tracker/models/user.dart';
import 'package:travel_tracker/services/api_service.dart';

class AuthService with ChangeNotifier {
  User? _user;
  String? _token;
  bool _initialized = false;

  User? get user => _user;
  String? get token => _token;
  bool get isLoggedIn => _user != null;
  bool get isAdmin => _user?.isAdmin ?? false;
  bool get isInitialized => _initialized;

  Future<void> login(String email, String password) async {
    try {
      final response = await ApiService.login(email, password);
      
      _token = response['token'];
      _user = User.fromJson(response['user']);
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);
      await prefs.setString('user_email', _user!.email);
      await prefs.setBool('is_admin', _user!.isAdmin);
      
      notifyListeners();
    } catch (e) {
      throw Exception('Login failed');
    }
  }

  Future<void> autoLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final email = prefs.getString('user_email');
      final isAdmin = prefs.getBool('is_admin') ?? false;
      
      if (token != null && email != null) {
        _token = token;
        _user = User(
          id: 'user_123',
          email: email,
          phone: '+1234567890',
          isAdmin: isAdmin,
          ecoPoints: 350,
        );
      }
      _initialized = true;
      notifyListeners();
    } catch (e) {
      _initialized = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_email');
    await prefs.remove('is_admin');
    
    notifyListeners();
  }
}