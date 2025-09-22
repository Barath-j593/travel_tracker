import 'package:flutter/material.dart';
import 'package:travel_tracker/models/trip.dart';
import 'package:intl/intl.dart';

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