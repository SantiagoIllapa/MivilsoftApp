import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';

class StationMenuLogic extends ChangeNotifier {
  Station? currentStation;
  Function? commentCallback;
  StationMenuLogic({this.currentStation}) {
    loadComments();
  }
  void setCurrentStation(Station s) {
    currentStation = s;
    loadComments();
  }

  void loadComments() async {
    print("pre caca");
    commentCallback;
    print("caca");
    Future.delayed(const Duration(milliseconds: 4000), () {
      currentStation?.loading["comments"] = false;
    });
  }
}
