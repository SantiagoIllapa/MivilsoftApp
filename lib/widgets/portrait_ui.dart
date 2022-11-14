import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/Classes/conector.dart';
import 'package:mivilsoft_app/Classes/station.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/app/ui/screens/information/informationScreen.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:mivilsoft_app/widgets/custom_buttons.dart';
import 'package:mivilsoft_app/widgets/station_menu.dart';

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
    Station estacion = Station(context: context);
    estacion.address = "Naranjas y Aguacates, Ambato, Ecuador";
    estacion.title = "Estación Ficoa";
    List<Conector> conectores = [
      Conector(
          power: 250,
          type: chargerType.entries.elementAt(1),
          status: chargerStatus.entries.elementAt(0)),
      Conector(
          power: 150,
          type: chargerType.entries.elementAt(2),
          status: chargerStatus.entries.elementAt(1)),
      Conector(
          power: 350,
          type: chargerType.entries.elementAt(0),
          status: chargerStatus.entries.elementAt(2)),
      Conector(
          power: 110,
          type: chargerType.entries.elementAt(3),
          status: chargerStatus.entries.elementAt(0)),
      Conector(
          power: 110,
          type: chargerType.entries.elementAt(4),
          status: chargerStatus.entries.elementAt(0)),
      Conector(
          power: 110,
          type: chargerType.entries.elementAt(5),
          status: chargerStatus.entries.elementAt(0)),
    ];
    estacion.conectores = conectores;
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
