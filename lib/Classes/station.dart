import 'package:flutter/material.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class Conector {}

class Station {
  BuildContext context;
  String address = "";
  String title = "";
  Color availableColor = ColorConstant.unavailable;
  Station({required this.context});
  double score = 0;
  double distance = 0;
  bool isFavorite = false;
}
