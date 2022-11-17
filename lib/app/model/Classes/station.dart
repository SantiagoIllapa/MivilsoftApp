import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/model/Classes/comment.dart';
import 'package:mivilsoft_app/app/model/Classes/conector.dart';
import 'package:mivilsoft_app/app/controller/logic/station_menu_logic.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class Contact {
  String name;
  String phone;
  String email;
  Contact({
    required this.name,
    required this.email,
    required this.phone,
  });
}

class Station {
  String address = "";
  String title = "";
  Color availableColor = ColorConstant.unavailable;
  double score = 0;
  double distance = 0;
  bool isFavorite = false;
  List<Conector> conectors = [];
  List<Comment> comments = [];
  List<Widget> pictures = [];
  Map<String, bool> loading = {
    'conectors': true,
    'information': true,
    'pictures': true,
    'comments': true,
  };

  Contact contactPerson = Contact(
    name: "Juanito Perez",
    email: "juanitoperez@gmail.com",
    phone: "+593987654321",
  );

  String provider = "https://map.electromaps.com/es/p/3241234";
  Station() {
    _loadConectors();
    _loadInformation();
    _loadPictures();
  }
  void _loadConectors() async {
    address = "Naranjas y Aguacates, Ambato, Ecuador";
    title = "Estación Ficoa";
    conectors = conectores;
    loading["conectors"] = false;
  }

  void _loadInformation() async {
    Future.delayed(const Duration(milliseconds: 8000), () {
      loading["information"] = false;
    });
  }

  void _loadPictures() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

    final json = jsonDecode(response.body);
    for (var img in json) {
      pictures.add(Image.network(
        'https://picsum.photos/id/${img['id']}/150/150',
      ));
    }
    Future.delayed(const Duration(milliseconds: 4000), () {
      print("aaaa");

      loading["pictures"] = false;
    });
  }

  List<Conector> conectores = [
    Conector(
        power: 250,
        type: chargerType.entries.elementAt(1),
        status: chargerStatus.entries.elementAt(0)),
    Conector(
        power: 150,
        type: chargerType.entries.elementAt(2),
        status: chargerStatus.entries.elementAt(1)),
    Conector(
        power: 350,
        type: chargerType.entries.elementAt(0),
        status: chargerStatus.entries.elementAt(2)),
    Conector(
        power: 110,
        type: chargerType.entries.elementAt(3),
        status: chargerStatus.entries.elementAt(0)),
    Conector(
        power: 110,
        type: chargerType.entries.elementAt(4),
        status: chargerStatus.entries.elementAt(0)),
    Conector(
        power: 110,
        type: chargerType.entries.elementAt(5),
        status: chargerStatus.entries.elementAt(0)),
  ];
}
