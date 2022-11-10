// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});
  Widget legendItem(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            width: 35,
            height: 35,
            child: Iconify(
              Mdi.map_marker,
              size: 35,
              color: color,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: TextStyle(
                  color: ColorConstant.iconColor,
                  fontFamily: "Roboto",
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.buttonBackColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBackColor,
        title: const Text('Información'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Leyenda del mapa",
                  style: TextStyle(
                      color: ColorConstant.iconColor,
                      fontFamily: "Roboto",
                      fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Estado de las Estaciones",
                  style: TextStyle(
                      color: ColorConstant.iconColor,
                      fontFamily: "Roboto",
                      fontSize: 17),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstant.lightBorderColor)),
                child: Column(children: [
                  legendItem('Estación Disponible', ColorConstant.available),
                  legendItem('Estación Ocupada', ColorConstant.occupied),
                  legendItem('Estación No Funciona', ColorConstant.unavailable),
                ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Velocidad de carga de las estaciones",
                  style: TextStyle(
                      color: ColorConstant.iconColor,
                      fontFamily: "Roboto",
                      fontSize: 17),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstant.lightBorderColor)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          legendItem('Carga Lenta', ColorConstant.appBackColor),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "<11 KW",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorConstant.iconColor,
                                  fontFamily: "Roboto",
                                  fontSize: 10),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          legendItem(
                              'Carga Semi Rápida', ColorConstant.appBackColor),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "11-50 KW",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorConstant.iconColor,
                                  fontFamily: "Roboto",
                                  fontSize: 10),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          legendItem('Carga Ráida', ColorConstant.appBackColor),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "<50-150 KW",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorConstant.iconColor,
                                  fontFamily: "Roboto",
                                  fontSize: 10),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          legendItem(
                              'Carga Ultra Rápida', ColorConstant.appBackColor),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              ">150 KW",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorConstant.iconColor,
                                  fontFamily: "Roboto",
                                  fontSize: 10),
                            ),
                          ))
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstant.lightBorderColor)),
                  child: Column(
                    children: [
                      legendItem(
                          'Estación Disponible', ColorConstant.appBackColor),
                      legendItem('Estación Ocupada', ColorConstant.iconColor),
                      legendItem(
                          'Estación No Funciona', ColorConstant.borderColor),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstant.lightBorderColor)),
                  child: Column(
                    children: [
                      legendItem(
                          'Estación Disponible', ColorConstant.appBackColor),
                      legendItem('Estación Ocupada', ColorConstant.iconColor),
                      legendItem(
                          'Estación No Funciona', ColorConstant.borderColor),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstant.lightBorderColor)),
                  child: Column(
                    children: [
                      legendItem(
                          'Estación Disponible', ColorConstant.appBackColor),
                      legendItem('Estación Ocupada', ColorConstant.iconColor),
                      legendItem(
                          'Estación No Funciona', ColorConstant.borderColor),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstant.lightBorderColor)),
                  child: Column(
                    children: [
                      legendItem(
                          'Estación Disponible', ColorConstant.appBackColor),
                      legendItem('Estación Ocupada', ColorConstant.iconColor),
                      legendItem(
                          'Estación No Funciona', ColorConstant.borderColor),
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
