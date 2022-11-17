import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/model/Classes/comment.dart';
import 'package:mivilsoft_app/app/model/Classes/conector.dart';
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
  List<Conector>? conectors;
  List<Comment> comments = [];
  List<Image>? pictures;

  Contact contactPerson = Contact(
    name: "Juanito Perez",
    email: "juanitoperez@gmail.com",
    phone: "+593987654321",
  );

  String provider = "https://map.electromaps.com/es/p/3241234";
  Station() {
    _loadInformation();
  }
  Future<Object> getConectors() async {
    print("solicita conectors");
    return conectors ?? _loadConectors();
  }

  Future<Object> getPictures() async {
    print("solicita pictures");
    return pictures ?? _loadPictures();
  }

  Future<List<Image>> _loadPictures() async {
    print("no hay lista... creando");
    List<Image> newImageList = [];
    await Future.delayed(const Duration(milliseconds: 5000), () async {
      final response =
          await http.get(Uri.parse('https://picsum.photos/v2/list'));
      final json = jsonDecode(response.body);

      for (var img in json) {
        newImageList.add(
            Image.network('https://picsum.photos/id/${img['id']}/500/500'));
      }
    });
    print('imagenes cargadas');
    pictures = newImageList;
    return newImageList;
  }

  Future<List<Conector>> _loadConectors() async {
    List<Conector> newConectorList = [];
    await Future.delayed(const Duration(milliseconds: 5000), () {
      newConectorList = conectores;
    });
    address = "Naranjas y Aguacates, Ambato, Ecuador";
    title = "Estación Ficoa";
    print('conectores cargados');
    conectors = newConectorList;
    return newConectorList;
  }

  void _loadInformation() async {
    Future.delayed(const Duration(milliseconds: 8000), () {});
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
