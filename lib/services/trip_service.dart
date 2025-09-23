import 'package:travel_tracker/models/trip.dart';

class TripService {
  static Trip? _activeTrip;
  static final List<Trip> _tripHistory = [];

  static Trip? getActiveTrip() {
    return _activeTrip;
  }

  static void setActiveTrip(Trip trip) {
    _activeTrip = trip;
  }

  static void completeTrip(Trip trip) {
    final completedTrip = Trip(
      id: trip.id,
      startTime: trip.startTime,
      endTime: DateTime.now(),
      transportMode: trip.transportMode,
      distance: 8.5,
      startLocation: trip.startLocation,
      endLocation: LocationPoint(10.5, 76.3),
      companions: trip.companions,
    );
    
    _activeTrip = null;
    _tripHistory.add(completedTrip);
  }

  static List<Trip> getTripHistory() {
    return List<Trip>.from(_tripHistory);
  }

  static void updateTripMode(String tripId, String newMode) {
    final index = _tripHistory.indexWhere((trip) => trip.id == tripId);
    if (index != -1) {
      final oldTrip = _tripHistory[index];
      final updatedTrip = Trip(
        id: oldTrip.id,
        startTime: oldTrip.startTime,
        endTime: oldTrip.endTime,
        transportMode: newMode,
        distance: oldTrip.distance,
        startLocation: oldTrip.startLocation,
        endLocation: oldTrip.endLocation,
        companions: oldTrip.companions,
      );
      _tripHistory[index] = updatedTrip;
    }
  }

  static void initializeMockData() {
    if (_tripHistory.isEmpty) {
      _tripHistory.addAll([
        Trip(
          id: '1',
          startTime: DateTime.now().subtract(Duration(days: 2)),
          endTime: DateTime.now().subtract(Duration(days: 2, hours: 1)),
          transportMode: 'car',
          distance: 15.5,
          startLocation: LocationPoint(10.0, 76.2),
          endLocation: LocationPoint(10.5, 76.3),
        ),
        Trip(
          id: '2',
          startTime: DateTime.now().subtract(Duration(days: 5)),
          endTime: DateTime.now().subtract(Duration(days: 5, hours: 2)),
          transportMode: 'bus',
          distance: 25.0,
          startLocation: LocationPoint(10.1, 76.2),
          endLocation: LocationPoint(10.8, 76.4),
        ),
      ]);
    }
  }
}