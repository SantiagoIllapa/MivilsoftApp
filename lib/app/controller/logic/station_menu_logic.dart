import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';

class StationMenuLogic extends ChangeNotifier {
  Station? currentStation;
  StationMenuLogic({this.currentStation}) {}
}
