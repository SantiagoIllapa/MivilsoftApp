import 'package:flutter/widgets.dart';
import 'package:mivilsoft_app/app/view/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? Routes.HOME : Routes.PERMISSIONS;
    notifyListeners();
  }
}
