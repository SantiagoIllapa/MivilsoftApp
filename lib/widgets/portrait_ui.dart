import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/app/ui/screens/information/informationScreen.dart';
import 'package:mivilsoft_app/widgets/custom_buttons.dart';

import '../app/ui/routes/routes.dart';

// ignore: camel_case_types, must_be_immutable

// ignore: must_be_immutable
class PortraitGui extends StatelessWidget {
  HomeController? mapControler;
  GlobalKey<ScaffoldState>? scaffoldKey;
  Function? change;
  PortraitGui({
    super.key,
    required this.mapControler,
    required this.scaffoldKey,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth / 15),
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
                        top: screenHeight / 45, bottom: screenHeight / 45),
                    child: Container(
                      width: screenHeight / 15,
                      height: screenHeight / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight),
                          color: const Color(0xffF9F9F7),
                          border: Border.all(
                              color: const Color.fromARGB(80, 0, 0, 0))),
                      child: IconButton(
                        icon: PopupMenuButton(
                          child: const Iconify(
                            Ic.round_layers,
                            color: Color(0xFF555555),
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
                          },
                        ),
                        onPressed: () {},
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight / 45, bottom: screenHeight / 45),
                  child: CustomIconButton(
                    icon: Bi.info_lg,
                    size: screenHeight / 15,
                    funct: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InformationScreen()));
                    },
                    heroTag: "Info",
                  ), //Información
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(
            //     left: screenWidth / 15,
            //     right: screenWidth / 15,
            //     top: screenHeight / 5,
            //     bottom: screenHeight / 20),
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Ri.gas_station_fill,
                    size: screenHeight / 15,
                    funct: () {},
                    heroTag: 'AddEstacion',
                  ), //Add Estación
                  CustomIconButton(
                    icon: Ic.round_gps_fixed,
                    size: screenHeight / 15,
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
