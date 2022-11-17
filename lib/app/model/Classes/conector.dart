import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/utils/constants.dart';

Map<String, String> chargerType = {
  "CCS1": Mdi.ev_plug_ccs1,
  "CCS2": Mdi.ev_plug_ccs2,
  "Chademo": Mdi.ev_plug_chademo,
  "Tesla": Mdi.ev_plug_tesla,
  "Type1": Mdi.ev_plug_type1,
  "Type2": Mdi.ev_plug_type2,
};

Map<String, Color> chargerStatus = {
  "Dañado": ColorConstant.unavailable,
  "Disponible": ColorConstant.available,
  "Ocupado": ColorConstant.occupied,
};

class Tariff {
  double parking;
  double fatrate;
  double priceKWh;
  Tariff(
      {required this.parking, required this.fatrate, required this.priceKWh});
}

class Conector {
  double? power = 0;
  MapEntry? type = chargerType.entries.first;
  MapEntry? status = chargerStatus.entries.first;
  bool isVerified = false;
  Tariff tarifa = Tariff(parking: 0.15, fatrate: 1, priceKWh: 0.95);
  Conector({this.power, this.status, this.type});
}
