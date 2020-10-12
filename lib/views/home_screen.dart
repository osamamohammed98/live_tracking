import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:live_tracking/view_models/map_notifier.dart';
import 'package:live_tracking/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mapNotifier = MapNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Live tracking demo"),
      ),
      body: AnimatedBuilder(
        animation: mapNotifier,
        builder: (_, __) => GoogleMap(
          zoomControlsEnabled: false,
          compassEnabled: true,
          trafficEnabled: true,
          initialCameraPosition: initialLocation,
          markers: mapNotifier.markers,
          circles: mapNotifier.circles,
          onMapCreated: (GoogleMapController controller) {
            mapNotifier.googleMapController = controller;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () => mapNotifier.subscribeToLocation(),
      ),
    );
  }

  @override
  void dispose() {
    mapNotifier.dispose();
    super.dispose();
  }
}
