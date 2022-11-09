import 'package:flutter/cupertino.dart';
import 'package:mivilsoft_app/app/ui/routes/routes.dart';
import 'package:mivilsoft_app/app/ui/screens/home/homeScreen.dart';
import 'package:mivilsoft_app/app/ui/screens/information/informationScreen.dart';
import 'package:mivilsoft_app/app/ui/screens/request_permission/request_permission_page.dart';
import 'package:mivilsoft_app/app/ui/screens/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => HomePage(),
    Routes.INFORMATION: (_) => const InformationScreen(),
  };
}
