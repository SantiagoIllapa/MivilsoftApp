import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';

class CustomIcons {
  static Widget electricStationA = Stack(children: const [
    Iconify(
      Ri.gas_station_fill,
      color: Color(0xFF555555),
    ),
    Iconify(
      Ri.flashlight_fill,
      color: Color.fromARGB(255, 255, 255, 255),
    )
  ]);
}
