import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/utils/constants.dart';

import '../app/ui/screens/information/informationScreen.dart';

// ignore: camel_case_types, must_be_immutable
class LandscapeGui extends StatelessWidget {
  HomeController? mapControler;
  GlobalKey<ScaffoldState>? scaffoldKey;
  LandscapeGui(
      {super.key, required this.mapControler, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Widget button(String icon, Function() fun) {
      return Expanded(
        child: IconButton(
            onPressed: fun,
            hoverColor: ColorConstant.buttonBackColor,
            icon: Iconify(
              icon,
              color: ColorConstant.iconColor,
            )),
      );
    }

    return Stack(children: [
      Container(
        width: screenWidth / 15,
        height: screenHeight,
        padding: EdgeInsets.symmetric(vertical: screenWidth / 35),
        decoration: BoxDecoration(
            color: ColorConstant.buttonBackColor,
            border: Border.all(color: ColorConstant.borderColor)),
        child: Column(
          children: [
            button(Ic.round_menu, () {
              scaffoldKey!.currentState?.openDrawer();
            }),
            button(Ri.search_line, () {}),
            Expanded(
              child: IconButton(
                hoverColor: ColorConstant.buttonBackColor,
                icon: PopupMenuButton(
                    child: Iconify(
                      Ic.round_layers,
                      color: ColorConstant.iconColor,
                      //size: screenWidth,
                    ),
                    itemBuilder: (context) {
                      return mapControler!.typeMapList.keys
                          .toList()
                          .map((e) => PopupMenuItem(
                              value: e,
                              child: TextButton(
                                onPressed: () {
                                  mapControler?.changeMapType(e);
                                },
                                child: Text(e),
                              )))
                          .toList();
                    }),
                onPressed: () {},
              ),
            ),
            button(Bi.info_lg, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformationScreen()));
            }),
            button(Ic.round_gps_fixed, () {}),
            button(Ri.gas_station_fill, () {}),
          ],
        ),
      )
    ]);
  }
}
