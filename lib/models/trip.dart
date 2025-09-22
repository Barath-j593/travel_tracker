import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trip {
  final String id;
  final DateTime startTime;
  final DateTime? endTime;
  final String transportMode;
  final double distance;
  final LatLng startLocation;
  final LatLng endLocation;
  final List<String> companions;

  Trip({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.transportMode,
    required this.distance,
    required this.startLocation,
    required this.endLocation,
    this.companions = const [],
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      startTime: DateTime.parse(json['startTime']),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      transportMode: json['transportMode'],
      distance: json['distance'].toDouble(),
      startLocation: LatLng(
        json['startLocation']['lat'],
        json['startLocation']['lng'],
      ),
      endLocation: LatLng(
        json['endLocation']['lat'],
        json['endLocation']['lng'],
      ),
      companions: List<String>.from(json['companions']),
    );
  }
}