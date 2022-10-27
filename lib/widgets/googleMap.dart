// ignore_for_file: file_names, no_logic_in_create_state

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class MivilMap extends StatefulWidget {
  GoogleMapController? controller;
  MivilMap({super.key, required this.controller});

  @override
  State<MivilMap> createState() => _MivilMapState();
}

class _MivilMapState extends State<MivilMap> {
  GoogleMapController? controller;

  final _initialCameraPos = const CameraPosition(
      target: LatLng(-0.22985, -78.52495), zoom: 15); //Ubi Quito
  @override
  Widget build(BuildContext context) {
    // Completer<GoogleMapController> _controller = Completer();
    return GoogleMap(
      onMapCreated: (GoogleMapController contro) {
        controller = contro;
      },
      initialCameraPosition: _initialCameraPos,
      zoomControlsEnabled: false,
      compassEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }
}
