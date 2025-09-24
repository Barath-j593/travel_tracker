import 'package:flutter/material.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';

class TripRecordSimpleScreen extends StatefulWidget {
  @override
  _TripRecordSimpleScreenState createState() => _TripRecordSimpleScreenState();
}

class _TripRecordSimpleScreenState extends State<TripRecordSimpleScreen> {
  bool _isRecording = false;
  DateTime? _startTime;
  Duration _duration = Duration();
  double _distance = 0.0;
  String _transportMode = 'car';

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording) {
        _startTime = DateTime.now();
        _startTimer();
      } else {
        _duration = Duration();
        _showTripSummary();
      }
    });
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isRecording && mounted) {
        setState(() {
          _duration += Duration(seconds: 1);
          _distance = _duration.inSeconds * 0.01;
        });
        _startTimer();
      }
    });
  }

  void _showTripSummary() {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.tripCompleted),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${loc.duration}: ${_formatDuration(_duration)}'),
            Text('${loc.distance}: ${_distance.toStringAsFixed(2)} km'),
            Text('${loc.mode}: ${_transportMode.toUpperCase()}'),
            Text('${loc.ecoPoints}: +${(_distance * 10).toInt()}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.ok),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    final loc = AppLocalizations.of(context)!;
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade50, Colors.green.shade50],
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: 50, left: 50, child: Icon(Icons.location_pin, color: Colors.red, size: 40)),
          Positioned(bottom: 50, right: 50, child: Icon(Icons.location_pin, color: Colors.green, size: 40)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map, size: 60, color: Colors.blue),
                SizedBox(height: 16),
                Text(loc.liveGPSTracking, style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(loc.simulatingTrip, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.recordTrip)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMapPlaceholder(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMetric(loc.duration, _formatDuration(_duration)),
                          _buildMetric(loc.distance, '${_distance.toStringAsFixed(2)} km'),
                          _buildMetric(loc.mode, _transportMode.toUpperCase()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _transportMode,
                    items: ['car', 'bus', 'bicycle', 'walk', 'train']
                        .map((mode) => DropdownMenuItem(
                              value: mode,
                              child: Row(
                                children: [
                                  Icon(_getTransportIcon(mode)),
                                  SizedBox(width: 8),
                                  Text(mode.toUpperCase()),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: _isRecording
                        ? null
                        : (value) {
                            if (value != null) setState(() => _transportMode = value);
                          },
                    decoration: InputDecoration(
                      labelText: loc.transportMode,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _toggleRecording,
                    icon: Icon(_isRecording ? Icons.stop : Icons.play_arrow),
                    label: Text(_isRecording ? loc.stopTrip : loc.startTrip),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: _isRecording ? Colors.red : Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  if (_isRecording) ...[
                    SizedBox(height: 16),
                    LinearProgressIndicator(),
                    SizedBox(height: 8),
                    Text(
                      loc.recordingTrip,
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTransportIcon(String mode) {
    switch (mode.toLowerCase()) {
      case 'car':
        return Icons.directions_car;
      case 'bus':
        return Icons.directions_bus;
      case 'bicycle':
        return Icons.pedal_bike;
      case 'walk':
        return Icons.directions_walk;
      case 'train':
        return Icons.train;
      default:
        return Icons.directions;
    }
  }

  Widget _buildMetric(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  @override
  void dispose() {
    _isRecording = false;
    super.dispose();
  }
}
