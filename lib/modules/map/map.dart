import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tech2/widgets/shared_app_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        menuButtonHandler: openDrawer,
        refreshButtonHandler: () {},
      ),
      body: const GoogleMap(
        initialCameraPosition: _kGooglePlex,
      ),
    );
  }
}
