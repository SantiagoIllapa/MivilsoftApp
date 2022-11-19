import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/controller/services/station_service.dart';
import 'package:mivilsoft_app/app/model/Classes/comment.dart';
import 'package:mivilsoft_app/app/model/Classes/conector.dart';
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
  String address = "";
  String title = "";
  Color availableColor = ColorConstant.unavailable;
  double score = 0;
  double distance = 0;
  bool isFavorite = false;
  List<Conector>? conectors;
  List<Comment>? comments;
  List<Image>? pictures;
  Contact contactPerson = Contact(
    name: "Juanito Perez",
    email: "juanitoperez@gmail.com",
    phone: "+593987654321",
  );

  String provider = "https://map.electromaps.com/es/p/3241234";
  Station();

  Future<Object> getConectors() async {
    return conectors ?? _loadConectors();
  }

  Future<Object> getPictures() async {
    return pictures ?? _loadPictures();
  }

  Future<Object> getComments() async {
    return comments ?? _loadComments();
  }

  Future<List<Comment>> _loadComments() async {
    List<Comment> newCommentList = [];
    try {
      newCommentList = await getCommentsData();
    } catch (e) {
      e;
    }
    comments = newCommentList;
    return newCommentList;
  }

  Future<List<Image>> _loadPictures() async {
    List<Image> newImageList = [];
    List<String> response;
    try {
      response = await getPicturesData();
      for (String url in response) {
        newImageList.add(Image.network(url));
      }
    } catch (e) {
      e;
    }
    pictures = newImageList;
    return newImageList;
  }

  Future<List<Conector>> _loadConectors() async {
    List<Conector> newConectorList = [];
    try {
      newConectorList = await getConectorsData();
    } catch (e) {
      e;
    }
    address = "Naranjas y Aguacates, Ambato, Ecuador";
    title = "Estación Ficoa";
    conectors = newConectorList;
    return newConectorList;
  }
}
