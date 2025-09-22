import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/models/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  static const String baseUrl = 'https://api.traveltracker.example';

  // Mock login function
  static Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    
    // Mock response
    return {
      'token': 'mock_jwt_token_12345',
      'user': {
        'id': 'user_123',
        'email': email,
        'phone': '+1234567890',
        'isAdmin': email == 'admin@example.com',
        'ecoPoints': 350,
      }
    };
  }

  // Mock trip history
  static Future<List<Trip>> getTripHistory() async {
    await Future.delayed(Duration(seconds: 1));
    
    return [
      Trip(
        id: 'trip_1',
        startTime: DateTime.now().subtract(Duration(days: 2)),
        endTime: DateTime.now().subtract(Duration(days: 2, hours: 1)),
        transportMode: 'car',
        distance: 15.5,
        startLocation: LatLng(10.0, 76.2),
        endLocation: LatLng(10.5, 76.3),
      ),
      Trip(
        id: 'trip_2',
        startTime: DateTime.now().subtract(Duration(days: 5)),
        endTime: DateTime.now().subtract(Duration(days: 5, hours: 2)),
        transportMode: 'bus',
        distance: 25.0,
        startLocation: LatLng(10.1, 76.2),
        endLocation: LatLng(10.8, 76.4),
      ),
    ];
  }
}