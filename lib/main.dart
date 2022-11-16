import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mivilsoft_app/app/view/routes/pages.dart';
import 'package:mivilsoft_app/app/view/routes/routes.dart';
import 'package:mivilsoft_app/app/controller/logic/location_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetMaterialApp(
      title: 'MivilCharge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.SPLASH,
      routes: appRoutes(),
    );
  }
}
