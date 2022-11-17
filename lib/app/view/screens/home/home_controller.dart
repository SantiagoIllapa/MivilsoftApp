import 'package:flutter/widgets.dart' show ChangeNotifier;

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier {
  Map<String, MapType> typeMapList = {
    "Satelital": MapType.satellite,
    "Terreno": MapType.terrain,
    "Normal": MapType.normal,
    "Hybrido": MapType.hybrid
  };
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  final initialCameraPos =
      const CameraPosition(target: LatLng(-0.22985, -78.52495), zoom: 15);

  var mapType = MapType.satellite;

  GoogleMapController? _mapController;
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void onTap(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position: position);
    _markers[markerId] = marker;
    notifyListeners();
  }

  void changeMapType(tipo) {
    var type = MapType.normal;
    typeMapList.forEach((key, value) {
      if (tipo == key) {
        type = value;
      }
    });
    mapType = type;
    notifyListeners();
  }
}
