import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobLocationScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-37.8167, 144.9626),
    zoom: 5,
  );

  const JobLocationScreen(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) =>
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(latitude, longitude), zoom: 13))),
        markers: {
          Marker(
              markerId: const MarkerId('job visit location'),
              position: LatLng(latitude, longitude))
        },
      ),
    );
  }
}
