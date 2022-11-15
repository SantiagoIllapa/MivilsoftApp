// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/Classes/conector.dart';
import 'package:mivilsoft_app/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class ConnectorSection extends StatefulWidget {
  Station station;

  ConnectorSection({super.key, required this.station});

  @override
  State<ConnectorSection> createState() => _ConnectorSectionState();
}

class _ConnectorSectionState extends State<ConnectorSection> {
  List<Widget> conectorsWidgets = [];
  late bool loading;
  @override
  void initState() {
    loading = true;
    buildConectors();
    super.initState();
  }

  Widget buttonAction(String icon, Function fun) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => fun(),
        child: Iconify(
          icon,
          color: ColorConstant.grayColor,
        ),
      ),
    );
  }

  void buildConectors() {
    for (Conector conector in widget.station.conectors) {
      conectorsWidgets.add(Container(
        height: 45,
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
                          fontSize: 12),
                    ),
                    Text(
                      '${conector.power} kW',
                      style: TextStyle(
                          color: ColorConstant.grayColor, fontSize: 10),
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
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buttonAction(Mdi.check_circle_outline, () {
                  print('Check');
                }),
                buttonAction(Mdi.calendar_edit_outline, () {
                  print('Calendario');
                }),
                buttonAction(Mdi.cellphone_wireless, () {
                  print('Cell');
                }),
                buttonAction(Mdi.currency_usd_circle_outline, () {
                  print('Dollar');
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buttonAction(Mdi.menu, () {
                    print('menu');
                  }),
                ),
              ],
            ),
          ),
        ]),
      ));
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        loading = false;
      });
    });
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
              "Conectores (${widget.station.conectors.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView(
                  children: conectorsWidgets,
                ))
        ],
      ),
    );
  }
}
