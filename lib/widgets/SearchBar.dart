// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class CustomSearchBar extends StatefulWidget {
  double? deviceHeight;
  double? deviceWidth;
  CustomSearchBar(
      {super.key, required this.deviceHeight, required this.deviceWidth});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      //Barra de Búsqueda
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
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
            PopupMenuButton<Menu>(
                // Callback that sets the selected popup menu item.
                icon: const Iconify(
                  Ic.round_menu,
                  color: Colors.black,
                ),
                onSelected: (Menu item) {
                  setState(() {
                    _selectedMenu = item.name;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        value: Menu.itemOne,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemTwo,
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemThree,
                        child: Text('Item 3'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemFour,
                        child: Text('Item 4'),
                      ),
                    ]),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  controller: searchController,
                  decoration: const InputDecoration(labelText: "Buscar"),
                ),
              ),
            ),
            PopupMenuButton<Menu>(
                // Callback that sets the selected popup menu item.
                icon: const Iconify(
                  Ic.outline_filter_alt,
                  color: Colors.black,
                ),
                onSelected: (Menu item) {
                  setState(() {
                    _selectedMenu = item.name;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        value: Menu.itemOne,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemTwo,
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemThree,
                        child: Text('Item 3'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemFour,
                        child: Text('Item 4'),
                      ),
                    ]),
          ],
        ),
      ),
    );
  }
}
