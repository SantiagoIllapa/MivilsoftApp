import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';

// ignore: camel_case_types, must_be_immutable
class LandscapeGui extends StatelessWidget {
  double? screenWidth;
  double? screenHeight;
  GoogleMapController? mapControler;
  GlobalKey<ScaffoldState>? scaffoldKey;
  LandscapeGui(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.mapControler,
      required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    Widget button(String icon, Function() fun) {
      return Expanded(
        child: IconButton(
            onPressed: fun,
            hoverColor: const Color(0xffF9F9F7),
            icon: Iconify(
              icon,
              size: screenWidth!,
              color: const Color(0xFF555555),
            )),
      );
    }

    return Stack(children: [
      Container(
        width: screenWidth! / 15,
        height: screenHeight,
        padding: EdgeInsets.symmetric(vertical: screenWidth! / 35),

        // EdgeInsets.only(top: screenWidth! / 35, bottom: screenWidth! / 35),
        decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 37, 37, 0),
            color: const Color(0xffF9F9F7),
            border: Border.all(color: const Color.fromARGB(10, 0, 0, 0))),
        child: Column(
          children: [
            button(Ic.round_menu, () {
              scaffoldKey!.currentState?.openDrawer();
            }),
            button(Ri.search_line, () {}),
            button(Ic.round_layers, () {}),
            button(Bi.info_lg, () {}),
            button(Ic.round_gps_fixed, () {}),
            button(Ri.gas_station_fill, () {}),
          ],
        ),
      )
    ]);
  }
}
