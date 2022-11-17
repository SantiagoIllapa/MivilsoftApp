import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/model/Classes/conector.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';
import 'package:mivilsoft_app/app/view/screens/home/home_controller.dart';
import 'package:mivilsoft_app/app/view/screens/informationScreen.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:mivilsoft_app/app/view/widgets/custom_buttons.dart';
import 'package:mivilsoft_app/app/view/widgets/station_menu.dart';

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
    double buttonSize = screenHeight / 15;
    double buttonPadding = screenHeight / 45;
    return Padding(
      padding: EdgeInsets.all(buttonPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: buttonPadding),
                    child: Container(
                      width: buttonSize,
                      height: buttonSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight),
                          color: ColorConstant.buttonBackColor,
                          border: Border.all(color: ColorConstant.borderColor)),
                      child: IconButton(
                        icon: PopupMenuButton(
                          child: Iconify(
                            Ic.round_layers,
                            color: ColorConstant.grayColor,
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
                  padding: EdgeInsets.symmetric(vertical: buttonPadding),
                  child: CustomIconButton(
                    icon: Bi.info_lg,
                    size: buttonSize,
                    funct: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InformationScreen()));
                    },
                  ), //Información
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                      icon: Ic.round_ev_station,
                      size: buttonSize,
                      funct: () {
                        showBottomSheet(
                            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                            context: context,
                            builder: (BuildContext context) {
                              Station estacion = Station();
                              return StationMenu(
                                station: estacion,
                              );
                            });
                      }), //Add Estación
                  CustomIconButton(
                    icon: Ic.round_gps_fixed,
                    size: buttonSize,
                    funct: () {},
                  ), //GPS
                ]),
          ),
        ],
      ),
    );
  }
}
