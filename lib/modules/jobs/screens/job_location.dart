import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobLocationScreen extends StatelessWidget {
  const JobLocationScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    const kGooglePlex = CameraPosition(
      target: LatLng(-37.8167, 144.9626),
      zoom: 5,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) =>
            controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(latitude, longitude), zoom: 13),
          ),
        ),
        markers: {
          Marker(
            markerId: const MarkerId('job visit location'),
            position: LatLng(latitude, longitude),
          ),
        },
      ),
    );
  }
}
