import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_tracker/models/user.dart';
import 'package:travel_tracker/services/api_service.dart';

class AuthService with ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  bool get isLoggedIn => _user != null;

  Future<void> login(String email, String password) async {
    try {
      final response = await ApiService.login(email, password);
      
      _token = response['token'];
      _user = User.fromJson(response['user']);
      
      // Save token to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);
      
      notifyListeners();
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    
    if (token != null) {
      _token = token;
      // In a real app, you would verify the token and get user data
      // For demo purposes, we'll use a mock user
      _user = User(
        id: 'user_123',
        email: 'demo@example.com',
        phone: '+1234567890',
        isAdmin: false,
        ecoPoints: 350,
      );
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    
    notifyListeners();
  }
}