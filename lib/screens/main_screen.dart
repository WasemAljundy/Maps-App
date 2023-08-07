import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GoogleMapController _googleMapController;
  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(31.501649, 34.426705),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/payment_screen'),
            icon: const Icon(Icons.payment),
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _googleMapController = controller;
          });
        },

      ),
    );
  }
}
