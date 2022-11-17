import 'package:flutter/cupertino.dart';
import 'package:mivilsoft_app/app/view/routes/routes.dart';
import 'package:mivilsoft_app/app/view/screens/home/homeScreen.dart';
import 'package:mivilsoft_app/app/view/screens/informationScreen.dart';
import 'package:mivilsoft_app/app/view/screens/request_permission_page.dart';
import 'package:mivilsoft_app/app/view/screens/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => HomePage(),
    Routes.INFORMATION: (_) => const InformationScreen(),
  };
}
