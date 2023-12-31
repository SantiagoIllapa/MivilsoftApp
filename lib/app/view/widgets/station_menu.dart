// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/app/controller/logic/station_menu_logic.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';
import 'package:mivilsoft_app/app/view/widgets/station_menu_Sections/information_section.dart';
import 'package:mivilsoft_app/app/view/widgets/station_menu_Sections/pictures_section.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:mivilsoft_app/app/view/widgets/station_menu_Sections/comments_section.dart';
import 'package:mivilsoft_app/app/view/widgets/station_menu_Sections/conector_section.dart';

import 'package:provider/provider.dart';

class StationMenu extends StatefulWidget {
  Station station;

  StationMenu({super.key, required this.station});

  @override
  State<StationMenu> createState() => _StationMenuState();
}

class _StationMenuState extends State<StationMenu> {
  List<Widget> workArea = [];
  int index = 0;
  StationNavBar? myNavBar;
  @override
  void initState() {
    myNavBar = StationNavBar(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    // workArea.add(ConnectorSection(
    //   station: widget.station,
    // ));
    // workArea.add(InformationSection(
    //   station: widget.station,
    // ));
    // workArea.add(PicturesSection(
    //   station: widget.station,
    // ));
    // StationMenuLogic menuLogic =
    //     StationMenuLogic(currentStation: widget.station);

    // workArea.add(CommentsSection(
    //   stationController: menuLogic,
    // ));
    super.initState();
  }

  void addSections(StationMenuLogic menuLogic) {
    List<Widget> workArea1 = [];
    workArea1.add(ConnectorSection(
      station: widget.station,
    ));
    workArea1.add(InformationSection(
      station: widget.station,
    ));
    workArea1.add(PicturesSection(
      station: widget.station,
    ));

    workArea1.add(CommentsSection(
      station: widget.station,
    ));
    workArea = workArea1;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // margin: EdgeInsets.only(left: screenWidth / 2),
      decoration: BoxDecoration(
          color: ColorConstant.grayColor,
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: screenHeight * 0.6,
        // width: screenWidth / 2,
        child: Container(
          child: (Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorConstant.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25),
                      title: Text(
                        widget.station.title,
                        style: TextStyle(
                            color: ColorConstant.grayColor,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        widget.station.address,
                        style: TextStyle(
                          color: ColorConstant.grayColor,
                        ),
                      ),
                      trailing: Iconify(
                        Mdi.map_marker,
                        size: 35,
                        color: widget.station.availableColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Iconify(
                                Mdi.star,
                                color: ColorConstant.scoreColor,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(widget.station.score.toString()))
                            ],
                          ),
                          Row(children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.station.isFavorite =
                                      !widget.station.isFavorite;
                                });
                              },
                              icon: Iconify(
                                widget.station.isFavorite
                                    ? Mdi.heart
                                    : Mdi.heart_outline,
                                color: widget.station.isFavorite
                                    ? ColorConstant.heartColor
                                    : ColorConstant.grayColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Iconify(
                                Mdi.car_hatchback,
                                color: ColorConstant.grayColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text((widget.station.distance < 1
                                  ? "<1 km"
                                  : "$widget.station.distance km")),
                            )
                          ])
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ChangeNotifierProvider<StationMenuLogic>(
                  create: (_) => StationMenuLogic(),
                  child: Expanded(child:
                      Consumer<StationMenuLogic>(builder: (_, controller, __) {
                    addSections(controller);
                    return Container(
                      color: ColorConstant.backgroundColor,
                      child: workArea[index],
                    );
                  }))),
              Container(child: myNavBar),
            ],
          )),
        ),
      ),
    );
  }
}

class StationNavBar extends StatefulWidget {
  final Function currentIndex;
  const StationNavBar({super.key, required this.currentIndex});

  @override
  State<StationNavBar> createState() => _StationNavBarState();
}

class _StationNavBarState extends State<StationNavBar> {
  int index = 0;
  BottomNavigationBarItem barItem(String icon, String label, int idx) {
    return BottomNavigationBarItem(
        icon: Iconify(icon,
            color: (index == idx)
                ? ColorConstant.available
                : ColorConstant.grayColor),
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // unselectedItemColor: ColorConstant.grayColor,
      selectedItemColor: ColorConstant.available,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      items: [
        barItem(Mdi.power_plug, 'Conectores', 0),
        barItem(Mdi.information, 'Información', 1),
        barItem(Mdi.image, 'Imagenes', 2),
        barItem(Mdi.comment_text_multiple, 'Comentarios', 3),
      ],
    );
  }
}
