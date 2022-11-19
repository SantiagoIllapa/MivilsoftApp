// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class InformationSection extends StatefulWidget {
  Station station;
  InformationSection({super.key, required this.station});

  @override
  State<InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<InformationSection> {
  late bool loading;
  @override
  void initState() {
    loading = false;

    super.initState();
  }

  Widget informationBox(String title, String subtitle, bool isHipertext) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: ColorConstant.lightBorderColor))),
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: ColorConstant.grayColor,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: ColorConstant.grayColor, fontSize: 10),
          )),
    );
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
              "Información General",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView(
                  children: [
                    informationBox('Persona de Contacto',
                        widget.station.contactPerson.name, false),
                    informationBox('Teléfono de contacto',
                        widget.station.contactPerson.phone, true),
                    informationBox('Email de Contacto',
                        widget.station.contactPerson.email, true),
                    informationBox(
                        'Proveedor de Servicio', widget.station.provider, true),
                  ],
                ))
        ],
      ),
    );
  }
}
