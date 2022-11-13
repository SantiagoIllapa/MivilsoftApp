// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class StationMenu extends StatefulWidget {
  Station station;
  StationMenu({super.key, required this.station});

  @override
  State<StationMenu> createState() => _StationMenuState();
}

class _StationMenuState extends State<StationMenu> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.only(left: screenWidth / 2),
      decoration: BoxDecoration(
          color: ColorConstant.grayColor,
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: screenHeight / 2,
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
                              Iconify(
                                Mdi.star,
                                color: ColorConstant.scoreColor,
                              ),
                              Iconify(
                                Mdi.star,
                                color: ColorConstant.scoreColor,
                              ),
                              Iconify(
                                Mdi.star,
                                color: ColorConstant.scoreColor,
                              ),
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
                            Iconify(
                              widget.station.isFavorite
                                  ? Mdi.heart
                                  : Mdi.heart_outline,
                              color: ColorConstant.heartColor,
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
              Expanded(
                  child: Container(
                color: ColorConstant.backgroundColor,
              )),
              const StationNavBar(),
            ],
          )),
        ),
      ),
    );
  }
}

class StationNavBar extends StatefulWidget {
  const StationNavBar({super.key});

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
        label: 'Conectores');
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
