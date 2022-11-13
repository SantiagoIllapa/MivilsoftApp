// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/utils/constants.dart';

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
    Widget menuButton = Container();
    Widget filterButton = IconButton(
      icon: PopupMenuButton(
        child: Iconify(
          Ic.twotone_search,
          color: ColorConstant.grayColor,
        ),
        itemBuilder: (context) {
          return mapController!.typeMapList.keys
              .toList()
              .map((e) => PopupMenuItem(
                  value: e,
                  child: TextButton(
                    onPressed: () {
                      mapController?.changeMapType(e);
                    },
                    child: Text(e),
                  )))
              .toList();
        },
      ),
      onPressed: () {},
    );
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      menuButton = IconButton(
          onPressed: () {
            scaffoldKey!.currentState?.openDrawer();
          },
          icon: Iconify(
            Ic.round_menu,
            color: ColorConstant.grayColor,
          ));
    }
    return Container(
      //Barra de Búsqueda
      margin: EdgeInsets.only(
          left: 15, right: 15, bottom: 10, top: screenHeight / 20),
      height: screenHeight / 15,

      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorConstant.buttonBackColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorConstant.borderColor)),
      child: Row(
        children: [
          menuButton,
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                onTap: () {},
                style: TextStyle(fontSize: screenHeight / 50),
                decoration: const InputDecoration(
                  hintText: "Buscar",
                ),
              ),
            ),
          ),
          filterButton
        ],
      ),
    );
  }
}
