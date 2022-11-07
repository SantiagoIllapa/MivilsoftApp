// ignore_for_file: file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mivilsoft_app/widgets/searchBar.dart';
import 'package:mivilsoft_app/widgets/landscape_ui.dart';
import 'package:mivilsoft_app/widgets/main_menu.dart';
import 'package:mivilsoft_app/widgets/portrait_ui.dart';

class MapOptions extends State<HomePage> {
  var mapType = MapType.normal;
  void changeMapType(String tipo) {
    var type = MapType.satellite;
    if (tipo == "Satelital") {
      type = MapType.satellite;
    } else {
      type = MapType.normal;
    }
    setState(() {
      mapType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _initialCameraPos =
      const CameraPosition(target: LatLng(-0.22985, -78.52495), zoom: 15);
  MapOptions mapOptions = MapOptions();
  var mapType = MapType.normal;
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
      mapType: mapType,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
    Widget searchBar = CustomSearchBar(
        deviceHeight: screenHeight,
        deviceWidth: screenWidth,
        mapController: controller,
        scaffoldKey: _scaffoldKey);
    void changeMapTyp(String tipo) {
      var type = MapType.satellite;
      if (tipo == "Satelital") {
        type = MapType.satellite;
      } else {
        type = MapType.normal;
      }
      setState(() {
        mapType = type;
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: MainMenu(screenWidth: screenWidth),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Stack(
                children: [
                  map,
                  Column(
                    children: [
                      searchBar,
                      //Text('$screenWidth,$screenHeight'),
                      Expanded(
                        child: PortraitGui(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          mapControler: controller,
                          scaffoldKey: _scaffoldKey,
                          mapOpt: mapOptions,
                        ),
                      )
                    ],
                  )
                ],
              )
            : Stack(
                children: [
                  map,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LandscapeGui(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          mapControler: controller,
                          scaffoldKey: _scaffoldKey),
                      Expanded(child: searchBar),
                    ],
                  )
                ],
              ));
  }
}
