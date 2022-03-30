
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MultipleMarkerMap extends StatefulWidget {
  @override
  State<MultipleMarkerMap> createState() => MapSampleState();
}

class MapSampleState extends State<MultipleMarkerMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.42796133580664, -120.085749655962),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(markerId: MarkerId("1"),position: LatLng(30.42796133580664, -120.085749655962)),
    Marker(markerId: MarkerId("2"),position: LatLng(20.42796133580664, -118.085749655962)),
    Marker(markerId: MarkerId("3"),position: LatLng(12.42796133580664, -133.085749655962)),
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}