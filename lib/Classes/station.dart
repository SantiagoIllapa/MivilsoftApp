import 'package:flutter/material.dart';
import 'package:mivilsoft_app/Classes/comment.dart';
import 'package:mivilsoft_app/Classes/conector.dart';
import 'package:mivilsoft_app/utils/constants.dart';

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
  BuildContext context;
  String address = "";
  String title = "";
  Color availableColor = ColorConstant.unavailable;
  double score = 0;
  double distance = 0;
  bool isFavorite = false;
  List<Conector> conectors = [];
  List<Comment> comments = [];
  List<Image> pictures = [];
  Contact contactPerson = Contact(
    name: "Juanito Perez",
    email: "juanitoperez@gmail.com",
    phone: "+593987654321",
  );
  String provider = "https://map.electromaps.com/es/p/3241234";
  Station({required this.context});
}
