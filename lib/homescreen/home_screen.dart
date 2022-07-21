import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps/convert_latlang_to_address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.560057, 73.010341),
    zoom: 14,
  );
  List<Marker> _marker = [];

  List<Marker> _list = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.560057, 73.010341),
        infoWindow: InfoWindow(title: 'My Current Location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.590057, 73.020341),
        infoWindow: InfoWindow(title: 'Another  Location')),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(33.623374, 73.067903),
      infoWindow: InfoWindow(
          title:
              ' Naz Cinema RoadNaz Cinema Rd, Amirpura Mohalla, Rawalpindi, Punjab 46000, Pakistan'),
    ),
  ];
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
        mapToolbarEnabled: true,
        markers: Set<Marker>.of(_marker),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConvertLangLatToAddress()),
        );
      }),
    );
  }
}
