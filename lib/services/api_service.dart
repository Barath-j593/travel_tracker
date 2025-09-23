import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/services/trip_service.dart';

class ApiService {
  static const String baseUrl = 'https://api.traveltracker.example';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    
    final isAdmin = email == 'admin@example.com' && password == 'password';
    
    return {
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'user': {
        'id': 'user_${DateTime.now().millisecondsSinceEpoch}',
        'email': email,
        'phone': '+1234567890',
        'isAdmin': isAdmin,
        'ecoPoints': 350,
      }
    };
  }

  static Future<List<Trip>> getTripHistory() async {
    await Future.delayed(Duration(seconds: 1));
    
    TripService.initializeMockData();
    return TripService.getTripHistory();
  }

  static Future<bool> saveTrip(Trip trip) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}