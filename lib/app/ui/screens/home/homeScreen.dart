// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mivilsoft_app/widgets/searchBar.dart';
import 'package:mivilsoft_app/widgets/landscape_ui.dart';
import 'package:mivilsoft_app/widgets/main_menu.dart';
import 'package:mivilsoft_app/widgets/portrait_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _initialCameraPos =
      const CameraPosition(target: LatLng(-0.22985, -78.52495), zoom: 15);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double screenHeight = 1;
    double screenWidth = 1;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    GoogleMapController? controller;
    Widget map = GoogleMap(
      onMapCreated: (GoogleMapController contro) {
        controller = contro;
      },
      initialCameraPosition: _initialCameraPos,
      zoomControlsEnabled: false,
      compassEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: MainMenu(screenWidth: screenWidth),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Stack(
                children: [
                  map,
                  //Text('$screenWidth,$screenHeight'),
                  CustomSearchBar(
                      deviceHeight: deviceHeight,
                      deviceWidth: deviceWidth,
                      mapController: controller,
                      scaffoldKey: _scaffoldKey),
                  PortraitGui(
                      screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              )
            : Stack(
                children: [
                  map,
                  LandscapeGui(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      scaffoldKey: _scaffoldKey)
                ],
              ));
  }
}
