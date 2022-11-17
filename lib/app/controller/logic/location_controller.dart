import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:google_maps_webservice/src/places.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mivilsoft_app/app/controller/services/location_service.dart';

class LocationController extends GetxController {
  final Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
  List<Prediction> _predicctionList = [];
  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text.isNotEmpty) {
      print("buscando..");
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is " + data["status"]);
      if (data['status'] == 'OK') {
        _predicctionList = [];
        data['predictions'].forEach((prediction) =>
            _predicctionList.add(Prediction.fromJson(prediction)));
      }
    }
    return _predicctionList;
  }
}
