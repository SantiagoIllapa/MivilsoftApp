import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/ui/screens/home/homeScreen.dart';
import 'package:mivilsoft_app/widgets/custom_buttons.dart';
import 'package:mivilsoft_app/widgets/searchBar.dart';

// ignore: camel_case_types, must_be_immutable

class PortraitGui extends StatelessWidget {
  List<String> popList = ["Satelital", "normal"];
  double? screenWidth;
  double? screenHeight;
  GoogleMapController? mapControler;
  GlobalKey<ScaffoldState>? scaffoldKey;
  MapOptions? mapOpt;
  PortraitGui({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.mapControler,
    required this.scaffoldKey,
    required this.mapOpt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth! / 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight! / 45, bottom: screenHeight! / 45),
                    child: PopupMenuButton(
                      child: const Iconify(Ic.round_layers),
                      itemBuilder: (context) {
                        return popList
                            .map((e) => PopupMenuItem(
                                value: e,
                                child: TextButton(
                                  onPressed: () {
                                    scaffoldKey!.currentState!.setState(() {});
                                  },
                                  child: Text(e),
                                )))
                            .toList();
                      },
                    )
                    // CustomIconButton(
                    //   icon: Ic.round_layers,
                    //   size: screenHeight! / 13,
                    //   funct: () {
                    //     print("hola");
                    //   },
                    //   heroTag: 'Capas',
                    // )
                    ), //Capas
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight! / 45, bottom: screenHeight! / 45),
                  child: CustomIconButton(
                    icon: Bi.info_lg,
                    size: screenHeight! / 13,
                    funct: () {},
                    heroTag: "Info",
                  ), //Información
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(
            //     left: screenWidth! / 15,
            //     right: screenWidth! / 15,
            //     top: screenHeight! / 5,
            //     bottom: screenHeight! / 20),
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Ri.gas_station_fill,
                    size: screenHeight! / 13,
                    funct: () {},
                    heroTag: 'AddEstacion',
                  ), //Add Estación
                  CustomIconButton(
                    icon: Ic.round_gps_fixed,
                    size: screenHeight! / 13,
                    funct: () {},
                    heroTag: 'Gps',
                  ), //GPS
                ]),
          ),
        ],
      ),
    );
  }
}
