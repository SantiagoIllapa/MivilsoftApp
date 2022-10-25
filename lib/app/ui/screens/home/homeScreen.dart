// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:mivilsoft_app/widgets/custom_buttons.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPos = const CameraPosition(
      target: LatLng(-0.22985, -78.52495), zoom: 15); //Ubi Quito
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Completer<GoogleMapController> _controller = Completer();
    double screenHeight = 1;
    double screenWidth = 1;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Stack(
                children: [
                  // GoogleMap(
                  //   onMapCreated: (GoogleMapController controller) {
                  //     _controller.complete(controller);
                  //   },
                  //   initialCameraPosition: _initialCameraPos,
                  //   zoomControlsEnabled: false,
                  //   compassEnabled: false,
                  //   mapType: MapType.normal,
                  //   myLocationEnabled: true,
                  //   myLocationButtonEnabled: false,
                  // ),

                  Container(
                    child: Column(
                      children: [
                        Text('$screenWidth,$screenHeight'),
                        Container(
                          //Barra de Búsqueda
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10, top: 10),
                          height: deviceHeight / 15,
                          width: deviceWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffF9F9F7),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color.fromARGB(10, 0, 0, 0))),
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                PopupMenuButton<Menu>(
                                    // Callback that sets the selected popup menu item.
                                    icon: const Iconify(
                                      Ic.round_menu,
                                      color: Colors.black,
                                    ),
                                    onSelected: (Menu item) {
                                      setState(() {
                                        _selectedMenu = item.name;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<Menu>>[
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemOne,
                                            child: Text('Item 1'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemTwo,
                                            child: Text('Item 2'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemThree,
                                            child: Text('Item 3'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemFour,
                                            child: Text('Item 4'),
                                          ),
                                        ]),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          searchText = value;
                                        });
                                      },
                                      controller: searchController,
                                      decoration: const InputDecoration(
                                          labelText: "Buscar"),
                                    ),
                                  ),
                                ),
                                PopupMenuButton<Menu>(
                                    // Callback that sets the selected popup menu item.
                                    icon: const Iconify(
                                      Ic.outline_filter_alt,
                                      color: Colors.black,
                                    ),
                                    onSelected: (Menu item) {
                                      setState(() {
                                        _selectedMenu = item.name;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<Menu>>[
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemOne,
                                            child: Text('Item 1'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemTwo,
                                            child: Text('Item 2'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemThree,
                                            child: Text('Item 3'),
                                          ),
                                          const PopupMenuItem<Menu>(
                                            value: Menu.itemFour,
                                            child: Text('Item 4'),
                                          ),
                                        ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 160, bottom: 20),
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: CustomIconButton(
                              icon: Ic.round_layers,
                              funct: () {},
                            )), //Capas
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomIconButton(
                              icon: Bi.info_lg, funct: () {}), //Información
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 30),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                              icon: Ri.gas_station_fill,
                              funct: () {}), //Add Estación
                          CustomIconButton(
                              icon: Ic.round_gps_fixed, funct: () {}), //GPS
                        ]),
                  )
                ],
              )
            : Container(
                child: const Center(
                  child: Text("Horizontal"),
                ),
              ));
  }
}
