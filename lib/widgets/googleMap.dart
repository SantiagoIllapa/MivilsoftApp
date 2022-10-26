// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MivilMap extends StatefulWidget {
  const MivilMap({super.key});

  @override
  State<MivilMap> createState() => _MivilMapState();
}

class _MivilMapState extends State<MivilMap> {
  final _initialCameraPos = const CameraPosition(
      target: LatLng(-0.22985, -78.52495), zoom: 15); //Ubi Quito
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
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
