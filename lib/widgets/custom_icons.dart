import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class CustomIcons {
  static Widget electricStationA = Stack(children: [
    Iconify(
      Ri.gas_station_fill,
      color: ColorConstant.iconColor,
    ),
    const Iconify(
      Ri.flashlight_fill,
      color: Color.fromARGB(255, 255, 255, 255),
    )
  ]);
}
