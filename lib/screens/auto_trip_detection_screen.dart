import 'package:flutter/material.dart';
import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/services/trip_service.dart';
import 'package:travel_tracker/utils/constants.dart';

class AutoTripDetectionScreen extends StatefulWidget {
  @override
  _AutoTripDetectionScreenState createState() => _AutoTripDetectionScreenState();
}

class _AutoTripDetectionScreenState extends State<AutoTripDetectionScreen> {
  bool _isDetecting = true;
  Trip? _currentTrip;
  Duration _tripDuration = Duration();
  double _tripDistance = 0.0;
  String _detectedMode = 'Walking';

  @override
  void initState() {
    super.initState();
    _startAutoDetection();
  }

  void _startAutoDetection() {
    // Simulate automatic trip detection
    _simulateTripDetection();
  }

  void _simulateTripDetection() {
    // Simulate detecting a new trip after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (mounted && _isDetecting) {
        setState(() {
          _currentTrip = Trip(
            id: 'auto_${DateTime.now().millisecondsSinceEpoch}',
            startTime: DateTime.now(),
            endTime: null,
            transportMode: _detectedMode,
            distance: 0.0,
            startLocation: LocationPoint(10.0, 76.2),
            endLocation: LocationPoint(10.0, 76.2),
          );
        });
        _startTripUpdates();
      }
    });
  }

  void _startTripUpdates() {
    // Update trip metrics every second
    Future.delayed(Duration(seconds: 1), () {
      if (mounted && _isDetecting && _currentTrip != null) {
        setState(() {
          _tripDuration = _tripDuration + Duration(seconds: 1);
          _tripDistance = _tripDistance + 0.02; // Simulate movement
          
          // Simulate mode detection changes
          if (_tripDuration.inSeconds % 30 == 0) {
            List<String> modes = ['Walking', 'Cycling', 'Driving', 'Public Transport'];
            _detectedMode = modes[(_tripDuration.inSeconds ~/ 30) % modes.length];
          }
        });
        _startTripUpdates();
      }
    });
  }

  void _endTrip() {
    setState(() {
      _isDetecting = false;
      if (_currentTrip != null) {
        TripService.completeTrip(_currentTrip!);
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Trip completed automatically!'),
        backgroundColor: kPrimaryColor,
      ),
    );
    
    // Return to home after a delay
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Automatic Trip Detection'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Show detection settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Detection Status Card
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.8)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isDetecting ? Icons.gps_fixed : Icons.gps_off,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isDetecting ? 'AUTOMATIC DETECTION ACTIVE' : 'DETECTION PAUSED',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _isDetecting 
                                ? 'Monitoring your movements...' 
                                : 'Detection paused',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                LinearProgressIndicator(
                  value: _isDetecting ? null : 0,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),

          // Current Trip Information
          if (_currentTrip != null) ...[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.trip_origin, color: kPrimaryColor),
                      SizedBox(width: 10),
                      Text(
                        'TRIP IN PROGRESS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTripMetric('Duration', _formatDuration(_tripDuration), Icons.access_time),
                      _buildTripMetric('Distance', '${_tripDistance.toStringAsFixed(1)} km', Icons.place),
                      _buildTripMetric('Mode', _detectedMode, Icons.directions),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Detected automatically based on your movement patterns',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],

          // Detection Visualization
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.gps_fixed,
                    size: 60,
                    color: kPrimaryColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _currentTrip != null ? 'Trip Detection Active' : 'Monitoring Movement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _currentTrip != null
                        ? 'Tracking your journey automatically'
                        : 'Waiting for significant movement...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 30),
                  if (_currentTrip != null) ...[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _endTrip,
                      child: Text('End Trip Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ] else ...[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Detection Info
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[50],
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue, size: 20),
                    SizedBox(width: 10),
                    Text(
                      'How automatic detection works:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '• Detects movement patterns using GPS and sensors\n'
                  '• Automatically identifies transport mode\n'
                  '• Starts tracking when significant movement is detected\n'
                  '• Respects privacy settings and battery optimization',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripMetric(String title, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: kPrimaryColor),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _isDetecting = false;
    super.dispose();
  }
}