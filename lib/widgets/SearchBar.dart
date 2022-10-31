// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
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
  double? deviceHeight;
  double? deviceWidth;
  GoogleMapController? mapController;
  GlobalKey<ScaffoldState>? scaffoldKey;
  CustomSearchBar(
      {super.key,
      required this.deviceHeight,
      required this.deviceWidth,
      required this.mapController,
      required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String searchText = "";
    String _selectedMenu = '';

    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Container(
          //Barra de Búsqueda
          margin:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 50),
          height: 45,

          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF9F9F7),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color.fromARGB(10, 0, 0, 0))),
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            child: Row(
              children: [
                FloatingActionButton(
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
                    color: Colors.black,
                  ),
                ),
                Flexible(
                  child: Container(
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(LocationSearchDialog(
                              mapController: mapController));
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration:
                              BoxDecoration(color: Colors.deepOrangeAccent),
                          child: Expanded(
                              child: Text(
                            '${locationController.pickPlaceMark.name ?? ''}'
                            '${locationController.pickPlaceMark.locality ?? ''}'
                            '${locationController.pickPlaceMark.postalCode ?? ''}'
                            '${locationController.pickPlaceMark.country ?? ''}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
