import 'package:flutter/material.dart';
import 'package:mivilsoft_app/Classes/comment.dart';
import 'package:mivilsoft_app/Classes/conector.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class Station {
  BuildContext context;
  String address = "";
  String title = "";
  Color availableColor = ColorConstant.unavailable;
  double score = 0;
  double distance = 0;
  bool isFavorite = false;
  List<Conector> conectores = [];
  List<Comment> comentarios = [];
  List<Image> fotos = [];
  Station({required this.context});
}
