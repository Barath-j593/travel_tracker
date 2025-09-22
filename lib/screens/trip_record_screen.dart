import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripRecordScreen extends StatefulWidget {
  @override
  _TripRecordScreenState createState() => _TripRecordScreenState();
}

class _TripRecordScreenState extends State<TripRecordScreen> {
  bool _isRecording = false;
  DateTime? _startTime;
  Duration _duration = Duration();
  double _distance = 0.0;
  String _transportMode = 'Car';

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording) {
        _startTime = DateTime.now();
        // Start timer
      } else {
        // Stop timer
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Record Trip')),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10.0, 76.2), // Example coordinates
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('current_location'),
                  position: LatLng(10.0, 76.2),
                ),
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMetric('Duration', _formatDuration(_duration)),
                    _buildMetric('Distance', '${_distance.toStringAsFixed(1)} km'),
                    _buildMetric('Mode', _transportMode),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _toggleRecording,
                  icon: Icon(_isRecording ? Icons.stop : Icons.play_arrow),
                  label: Text(_isRecording ? 'Stop Trip' : 'Start Trip'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: _isRecording ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    return '${duration.inMinutes} min';
  }
}