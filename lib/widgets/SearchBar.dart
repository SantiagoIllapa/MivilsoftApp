// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/app/ui/screens/location/location_controller.dart';
import 'package:mivilsoft_app/app/ui/screens/location/location_search_dialogue.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomSearchBar extends StatelessWidget {
  HomeController? mapController;
  GlobalKey<ScaffoldState>? scaffoldKey;
  CustomSearchBar(
      {super.key, required this.mapController, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController = TextEditingController();
    // String searchText = "";
    // String _selectedMenu = '';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Widget menuButton = Container();
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      menuButton = FloatingActionButton(
        onPressed: () {
          scaffoldKey!.currentState?.openDrawer();
        },
        disabledElevation: 0,
        focusElevation: 0,
        backgroundColor: const Color(0xffF9F9F7),
        foregroundColor: const Color(0xffF9F9F7),
        focusColor: const Color(0xffF9F9F7),
        hoverColor: const Color(0xffF9F9F7),
        elevation: 0,
        hoverElevation: 0,
        child: const Iconify(
          Ic.round_menu,
          color: Color(0xFF555555),
        ),
      );
    }
    return Container(
      //Barra de Búsqueda
      margin: EdgeInsets.only(
          left: 15, right: 15, bottom: 10, top: screenHeight / 25),
      height: screenHeight / 15,
      padding: EdgeInsets.symmetric(vertical: screenHeight / 100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromARGB(10, 0, 0, 0))),
      child: Row(
        children: [
          menuButton,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onTap: () {},
                style: TextStyle(fontSize: screenHeight / 50),
                decoration: const InputDecoration(
                  hintText: "Buscar",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
