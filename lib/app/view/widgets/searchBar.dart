// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/app/controller/services/location_service.dart';
import 'package:mivilsoft_app/app/view/screens/home/home_controller.dart';
import 'package:mivilsoft_app/utils/constants.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;
  StructuredFormatting({this.mainText, this.secondaryText});
  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}

class AutocompletePrediction {
  final String? description;
  final StructuredFormatting? structuredFormatting;
  final String? placeId;
  final String? reference;

  AutocompletePrediction(
      {this.description,
      this.structuredFormatting,
      this.placeId,
      this.reference});
  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }
}

class PlaceAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;
  PlaceAutocompleteResponse({this.status, this.predictions});
  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? json['predictions']
              .map<AutocompletePrediction>(
                  (json) => AutocompletePrediction.fromJson(json))
              .toList()
          : null,
    );
  }
  static PlaceAutocompleteResponse parseAutocompleteResult(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}

class CustomSearchBar extends StatefulWidget {
  HomeController? mapController;
  GlobalKey<ScaffoldState>? scaffoldKey;
  CustomSearchBar(
      {super.key, required this.mapController, required this.scaffoldKey});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  List<AutocompletePrediction> placePredictions = [];
  void placeAutoComplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": AppConstant.apiKeyPlace,
    });
    String? response = await getLocationData(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

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
          return widget.mapController!.typeMapList.keys
              .toList()
              .map((e) => PopupMenuItem(
                  value: e,
                  child: TextButton(
                    onPressed: () {
                      widget.mapController?.changeMapType(e);
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
            widget.scaffoldKey!.currentState?.openDrawer();
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

      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorConstant.buttonBackColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorConstant.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              menuButton,
              Expanded(
                  child: Form(
                child: TextFormField(
                  onChanged: (value) {
                    placeAutoComplete(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    hintText: "Buscar",
                  ),
                ),
              )),
              // Expanded(
              //   child: Container(
              //     padding: const EdgeInsets.only(bottom: 10.0),
              //     child: TextField(
              //       onTap: () {},
              //       style: TextStyle(fontSize: screenHeight / 50),
              //       decoration: const InputDecoration(
              //         hintText: "Buscar",
              //       ),
              //     ),
              //   ),
              // ),
              filterButton
            ],
          ),
          SizedBox(
            height: screenHeight / 2,
            child: Expanded(
              child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) => LocationListTile(
                      location: placePredictions[index].description!,
                      press: () {})),
            ),
          )
        ],
      ),
    );
  }
}

class LocationListTile extends StatelessWidget {
  final String location;
  final VoidCallback press;
  const LocationListTile(
      {super.key, required this.location, required this.press});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: const Iconify(Ic.round_search),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
        )
      ],
    );
  }
}
