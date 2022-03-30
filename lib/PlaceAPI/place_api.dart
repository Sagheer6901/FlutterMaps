import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttermaps/PlaceAPI/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceAPI extends StatefulWidget {
  const PlaceAPI({Key? key}) : super(key: key);

  @override
  _PlaceAPIState createState() => _PlaceAPIState();
}

class _PlaceAPIState extends State<PlaceAPI> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _textEditingController = new TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.42796133580664, -120.085749655962),
    zoom: 14.4746,
  );
  static final Marker _kLake = Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.43296265331129, -122.08832357078792));

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: _textEditingController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText: "Search.."),
                onChanged: (value) {
                  print(value);
                },
              )),
              IconButton(
                  onPressed: () async {
                    var place = await LocationService()
                        .getPlace(_textEditingController.text);
                    _goToPlace(place);
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {_kLake},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          )
        ],
      ),
    ));
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, lng),
      zoom: 12,
    )));
  }
}
