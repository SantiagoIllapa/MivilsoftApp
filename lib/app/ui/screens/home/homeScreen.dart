// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mivilsoft_app/widgets/SearchBar.dart';
import 'package:mivilsoft_app/widgets/googleMap.dart';
import 'package:mivilsoft_app/widgets/portrait_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double screenHeight = 1;
    double screenWidth = 1;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Stack(
                children: [
                  const MivilMap(),
                  //Text('$screenWidth,$screenHeight'),
                  CustomSearchBar(
                      deviceHeight: deviceHeight, deviceWidth: deviceWidth),
                  PortraitGui(
                      screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              )
            : Stack(
                children: [
                  const MivilMap(),

                  CustomSearchBar(
                      deviceHeight: deviceHeight, deviceWidth: deviceWidth),
                  //LandscapeGUI
                ],
              ));
  }
}
