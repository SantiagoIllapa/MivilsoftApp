// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/Classes/conector.dart';
import 'package:mivilsoft_app/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class ConnectorSection extends StatelessWidget {
  Station station;
  List<Widget> conectorsWidgets = [];
  ConnectorSection({super.key, required this.station}) {
    buildConectors();
  }
  Widget buttonAction(String icon, Function fun) {
    return Container(
      child: Iconify(icon, color: ColorConstant.grayColor),
    );
  }

  void buildConectors() {
    for (Conector conector in station.conectores) {
      conectorsWidgets.add(Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 100,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Iconify(conector.type?.value,
                    color: ColorConstant.grayColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      conector.type?.key,
                      style: TextStyle(
                          color: ColorConstant.grayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Text(
                      '${conector.power} kW',
                      style: TextStyle(
                          color: ColorConstant.grayColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 7),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: Text(
              conector.status?.key,
              style: TextStyle(
                  color: conector.status?.value,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: [
                buttonAction(Mdi.check_circle_outline, () {}),
                buttonAction(Mdi.calendar_edit_outline, () {}),
                buttonAction(Mdi.cellphone_wireless, () {}),
                buttonAction(Mdi.currency_usd_circle_outline, () {}),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buttonAction(Mdi.menu, () {}),
                ),
              ],
            ),
          ),
        ]),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Conectores (${station.conectores.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: conectorsWidgets,
          ))
        ],
      ),
    );
  }
}
