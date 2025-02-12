import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final LatLng _farmLocation = const LatLng(13.14920, 80.24596);
  final LatLng _warehouseLocation = const LatLng(12.96028, 80.05809);
  final String _googleApiKey = 'AIzaSyAsiuSgSw8Tz-NISovS4X4xu-8yKOh5rD0';
  final DateTime _estimatedDeliveryTime =
      DateTime.now().add(const Duration(hours: 5));
  List<LatLng> _routePoints = [];
  late Marker _packageMarker;
  int _currentStep = 0;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.addAll([
        Marker(
          markerId: const MarkerId('farmLocation'),
          position: _farmLocation,
          infoWindow: const InfoWindow(title: 'Farm Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: const MarkerId('warehouseLocation'),
          position: _warehouseLocation,
          infoWindow: const InfoWindow(title: 'Warehouse Location'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      ]);
    });
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_farmLocation.latitude},${_farmLocation.longitude}&destination=${_warehouseLocation.latitude},${_warehouseLocation.longitude}&key=$_googleApiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final routes = data['routes'] as List;
      if (routes.isNotEmpty) {
        final polylinePoints =
            _convertToLatLng(routes[0]['legs'][0]['steps'] as List);
        setState(() {
          _routePoints = polylinePoints;
          _polylines.add(Polyline(
            polylineId: const PolylineId('route'),
            points: polylinePoints,
            color: Colors.blue,
            width: 5,
          ));
          _packageMarker = Marker(
            markerId: const MarkerId('packageLocation'),
            position: _routePoints[0],
            infoWindow: const InfoWindow(title: 'Package Location'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          );
          _markers.add(_packageMarker);
        });
        _startPackageProgress();
      }
    } else {
      print('Failed to load route');
    }
  }

  List<LatLng> _convertToLatLng(List steps) {
    return steps
        .map((step) =>
            LatLng(step['end_location']['lat'], step['end_location']['lng']))
        .toList();
  }

  void _startPackageProgress() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      if (_currentStep < _routePoints.length - 1) {
        setState(() {
          _currentStep++;
          _packageMarker = Marker(
            markerId: const MarkerId('packageLocation'),
            position: _routePoints[_currentStep],
            infoWindow: const InfoWindow(title: 'Package Location'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          );
          _markers.add(_packageMarker);
        });
        mapController
            .moveCamera(CameraUpdate.newLatLng(_routePoints[_currentStep]));
      } else {
        timer.cancel();
        print("Package has reached the destination!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(_estimatedDeliveryTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tracking',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0), // Padding around the map edges
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  20.0), // Rounded border radius for the map
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _farmLocation,
                  zoom: 12.0,
                ),
                markers: _markers,
                polylines: _polylines,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Estimated Delivery Time:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0077B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ), // Action for the button
                    child: Text('Track Package',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
