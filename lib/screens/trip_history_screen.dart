import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/services/api_service.dart';
import 'package:intl/intl.dart';

class TripHistoryScreen extends StatefulWidget {
  @override
  _TripHistoryScreenState createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  List<Trip> _trips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    try {
      final trips = await ApiService.getTripHistory();
      setState(() {
        _trips = trips;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load trips: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trip History')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _trips.isEmpty
              ? Center(child: Text('No trips recorded yet'))
              : ListView.builder(
                  itemCount: _trips.length,
                  itemBuilder: (context, index) {
                    final trip = _trips[index];
                    return TripCard(trip: trip);
                  },
                ),
    );
  }
}

class TripCard extends StatefulWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              _getTransportIcon(widget.trip.transportMode),
              color: _getTransportColor(widget.trip.transportMode),
            ),
            title: Text(
              '${widget.trip.transportMode.toUpperCase()} - ${widget.trip.distance.toStringAsFixed(1)} km',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              DateFormat('MMM dd, yyyy - HH:mm').format(widget.trip.startTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() => _expanded = !_expanded);
              },
            ),
          ),
          if (_expanded) ...[
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trip Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Duration:'),
                      Text(_formatDuration(widget.trip)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Distance:'),
                      Text('${widget.trip.distance.toStringAsFixed(1)} km'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mode:'),
                      Text(widget.trip.transportMode.toUpperCase()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text('Map Preview',
                          style: TextStyle(color: Colors.grey[600])),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDuration(Trip trip) {
    if (trip.endTime == null) return 'Ongoing';
    final duration = trip.endTime!.difference(trip.startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  IconData _getTransportIcon(String mode) {
    switch (mode) {
      case 'car':
        return Icons.directions_car;
      case 'bus':
        return Icons.directions_bus;
      case 'bicycle':
        return Icons.directions_bike;
      case 'walk':
        return Icons.directions_walk;
      default:
        return Icons.directions;
    }
  }

  Color _getTransportColor(String mode) {
    switch (mode) {
      case 'car':
        return Colors.red;
      case 'bus':
        return Colors.blue;
      case 'bicycle':
        return Colors.green;
      case 'walk':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}