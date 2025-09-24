import 'package:flutter/material.dart';
import 'package:travel_tracker/models/trip.dart';
import 'package:travel_tracker/services/trip_service.dart';
import 'package:travel_tracker/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';

class TripHistoryScreen extends StatefulWidget {
  @override
  _TripHistoryScreenState createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  List<Trip> _trips = [];
  bool _isLoading = true;

  final List<String> _transportModes = ['walk', 'bicycle', 'car', 'bus', 'train'];
  final Map<String, String> _modeDisplayNames = {};

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
    }
  }

  void _updateTripMode(String tripId, String newMode) {
    final index = _trips.indexWhere((trip) => trip.id == tripId);
    if (index != -1) {
      TripService.updateTripMode(tripId, newMode);
      setState(() {
        final trip = _trips[index];
        _trips[index] = Trip(
          id: trip.id,
          startTime: trip.startTime,
          endTime: trip.endTime,
          transportMode: newMode,
          distance: trip.distance,
          startLocation: trip.startLocation,
          endLocation: trip.endLocation,
          companions: trip.companions,
        );
      });

      final loc = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${loc.transportModeUpdated} ${_modeDisplayNames[newMode] ?? newMode}')),
      );
    }
  }

  String _formatLocation(LocationPoint location) {
    return '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}';
  }

  String _getLocationName(LocationPoint location) {
    if (location.latitude > 10.2) return AppLocalizations.of(context)!.cityCenter;
    if (location.latitude > 10.1) return AppLocalizations.of(context)!.downtown;
    if (location.latitude > 10.0) return AppLocalizations.of(context)!.suburbanArea;
    return AppLocalizations.of(context)!.residentialArea;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    // Initialize mode display names with localization
    _modeDisplayNames.clear();
    _modeDisplayNames.addAll({
      'walk': loc.walk,
      'bicycle': loc.bicycle,
      'car': loc.car,
      'bus': loc.bus,
      'train': loc.train,
    });

    return Scaffold(
      appBar: AppBar(title: Text(loc.tripHistory)),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _trips.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history, size: 60, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(loc.noTrips),
                      SizedBox(height: 8),
                      Text(loc.tripsWillAppearHere, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _trips.length,
                  itemBuilder: (context, index) {
                    final trip = _trips[index];
                    return TripCard(
                      trip: trip,
                      onModeChanged: (newMode) => _updateTripMode(trip.id, newMode),
                      formatLocation: _formatLocation,
                      getLocationName: _getLocationName,
                      transportModes: _transportModes,
                      modeDisplayNames: _modeDisplayNames,
                    );
                  },
                ),
    );
  }
}

class TripCard extends StatefulWidget {
  final Trip trip;
  final Function(String) onModeChanged;
  final String Function(LocationPoint) formatLocation;
  final String Function(LocationPoint) getLocationName;
  final List<String> transportModes;
  final Map<String, String> modeDisplayNames;

  const TripCard({
    Key? key,
    required this.trip,
    required this.onModeChanged,
    required this.formatLocation,
    required this.getLocationName,
    required this.transportModes,
    required this.modeDisplayNames,
  }) : super(key: key);

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  bool _expanded = false;
  late String _selectedMode;

  @override
  void initState() {
    super.initState();
    _selectedMode = widget.transportModes.contains(widget.trip.transportMode)
        ? widget.trip.transportMode
        : widget.transportModes.first;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(_getTransportIcon(_selectedMode), color: _getTransportColor(_selectedMode)),
            title: Text(
              '${widget.modeDisplayNames[_selectedMode]?.toUpperCase() ?? _selectedMode.toUpperCase()} - ${widget.trip.distance.toStringAsFixed(1)} km',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('MMM dd, yyyy - HH:mm').format(widget.trip.startTime)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.place, size: 12, color: Colors.green),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${widget.getLocationName(widget.trip.startLocation)} → ${widget.getLocationName(widget.trip.endLocation)}',
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
          ),
          if (_expanded) ...[
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.tripDetails, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  _buildDetailRow(loc.duration, _formatDuration(widget.trip)),
                  _buildDetailRow(loc.distance, '${widget.trip.distance.toStringAsFixed(1)} km'),
                  _buildLocationRow(loc.startLocation, widget.getLocationName(widget.trip.startLocation),
                      widget.formatLocation(widget.trip.startLocation), Colors.green),
                  _buildLocationRow(loc.endLocation, widget.getLocationName(widget.trip.endLocation),
                      widget.formatLocation(widget.trip.endLocation), Colors.red),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${loc.transportMode}:'),
                      DropdownButton<String>(
                        value: _selectedMode,
                        items: widget.transportModes
                            .map((mode) => DropdownMenuItem(
                                  value: mode,
                                  child: Text(widget.modeDisplayNames[mode] ?? mode),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedMode = value);
                            widget.onModeChanged(value);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, size: 30, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            '${loc.route}: ${widget.getLocationName(widget.trip.startLocation)} to ${widget.getLocationName(widget.trip.endLocation)}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('$label:'),
        Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
      ]),
    );
  }

  Widget _buildLocationRow(String label, String name, String coordinates, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.place, size: 16, color: color),
              SizedBox(width: 4),
              Text('$label:'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(coordinates, style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Trip trip) {
    final loc = AppLocalizations.of(context)!;
    if (trip.endTime == null) return loc.ongoing;
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
        return Icons.pedal_bike;
      case 'walk':
        return Icons.directions_walk;
      case 'train':
        return Icons.train;
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
      case 'train':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
