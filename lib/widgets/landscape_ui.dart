import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/widgets/custom_buttons.dart';

// ignore: camel_case_types, must_be_immutable
class LandscapeGui extends StatelessWidget {
  double? screenWidth;
  double? screenHeight;
  LandscapeGui(
      {super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: screenWidth! / 15,
              right: screenWidth! / 15,
              top: screenHeight! / 5,
              bottom: screenHeight! / 5),
          alignment: Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight! / 45, bottom: screenHeight! / 45),
                  child: CustomIconButton(
                    icon: Ic.round_layers,
                    size: screenHeight! / 11,
                    funct: () {},
                  )), //Capas
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! / 45, bottom: screenHeight! / 45),
                child: CustomIconButton(
                    icon: Bi.info_lg,
                    size: screenHeight! / 11,
                    funct: () {}), //Información
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: screenWidth! / 15,
              right: screenWidth! / 15,
              top: screenHeight! / 5,
              bottom: screenHeight! / 20),
          alignment: Alignment.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomIconButton(
                icon: Ri.gas_station_fill,
                size: screenHeight! / 11,
                funct: () {}), //Add Estación
            CustomIconButton(
                icon: Ic.round_gps_fixed,
                size: screenHeight! / 11,
                funct: () {}), //GPS
          ]),
        )
      ],
    );
  }
}
