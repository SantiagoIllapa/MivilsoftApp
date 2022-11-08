// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mivilsoft_app/app/ui/screens/home/home_controller.dart';
import 'package:mivilsoft_app/widgets/searchBar.dart';
import 'package:mivilsoft_app/widgets/landscape_ui.dart';
import 'package:mivilsoft_app/widgets/main_menu.dart';
import 'package:mivilsoft_app/widgets/portrait_ui.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget createMap(HomeController controller) {
      return GoogleMap(
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: controller.initialCameraPos,
          zoomControlsEnabled: false,
          compassEnabled: false,
          mapType: controller.mapType,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          markers: controller.markers,
          onTap: controller.onTap);
    }

    Widget searchBar(HomeController controller) {
      return CustomSearchBar(
          mapController: controller, scaffoldKey: _scaffoldKey);
    }

    return ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            drawer: const MainMenu(),
            body: Consumer<HomeController>(
              builder: (_, controller, __) => Stack(children: [
                createMap(controller),
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? Column(
                        children: [
                          searchBar(controller),
                          //Text('$screenWidth,$screenHeight'),
                          Expanded(
                            child: PortraitGui(
                              mapControler: controller,
                              scaffoldKey: _scaffoldKey,
                              change: controller.changeMapType,
                            ),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          LandscapeGui(
                              mapControler: controller,
                              scaffoldKey: _scaffoldKey),
                        ],
                      ),
              ]),
            )));
  }
}
