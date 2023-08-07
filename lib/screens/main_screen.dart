import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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

  final Set<Marker> _markers = <Marker>{};
  final Set<Circle> _circles = <Circle>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var response = await Permission.location.request();
              if (response.isGranted) {
                print('GRANTED!');
              }
              else if (response.isDenied) {
                print('DENIED!');
              }
            },
            icon: const Icon(Icons.location_on_outlined),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/payment_screen'),
            icon: const Icon(Icons.payment),
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _googleMapController = controller;
          });
        },
        markers: _markers,
        circles: _circles,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (LatLng position) {
          addNewMarker(position);
          _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: position,
                zoom: 18,
              ),
            ),
          );
        },
        onLongPress: (LatLng position) {
          addNewCircle(position);
        },
      ),
    );
  }

  void addNewCircle(LatLng position) {
    var newCircle = Circle(
      circleId: CircleId('circle_${_circles.length}'),
      visible: true,
      radius: 10,
      strokeWidth: 1,
      strokeColor: Colors.red.shade800,
      fillColor: Colors.red.shade300,
      center: position,
    );
    setState(() {
      _circles.add(newCircle);
    });
  }

  void addNewMarker(LatLng position) {
    var newMarker = Marker(
      markerId: MarkerId('marker_${_markers.length}'),
      visible: true,
      position: position,
    );
    setState(() {
      _markers.add(newMarker);
    });
  }
}
