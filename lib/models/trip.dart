class LocationPoint {
  final double latitude;
  final double longitude;

  LocationPoint(this.latitude, this.longitude);
}

class Trip {
  final String id;
  final DateTime startTime;
  final DateTime? endTime;
  String transportMode;
  final double distance;
  final LocationPoint startLocation;
  final LocationPoint endLocation;
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
      id: json['id'] ?? 'default_id',
      startTime: DateTime.parse(json['startTime'] ?? DateTime.now().toString()),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      transportMode: json['transportMode'] ?? 'car',
      distance: (json['distance'] ?? 0.0).toDouble(),
      startLocation: LocationPoint(
        json['startLocation']?['lat'] ?? 10.0,
        json['startLocation']?['lng'] ?? 76.2,
      ),
      endLocation: LocationPoint(
        json['endLocation']?['lat'] ?? 10.5,
        json['endLocation']?['lng'] ?? 76.3,
      ),
      companions: List<String>.from(json['companions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'transportMode': transportMode,
      'distance': distance,
      'startLocation': {
        'lat': startLocation.latitude,
        'lng': startLocation.longitude,
      },
      'endLocation': {
        'lat': endLocation.latitude,
        'lng': endLocation.longitude,
      },
      'companions': companions,
    };
  }
}