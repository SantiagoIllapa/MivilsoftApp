import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String?> getLocationData(Uri uri, {Map<String, String>? header}) async {
  try {
    final response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return null;
}
