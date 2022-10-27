import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mivilsoft_app/app/ui/routes/pages.dart';
import 'package:mivilsoft_app/app/ui/routes/routes.dart';
import 'package:mivilsoft_app/app/ui/screens/location/location_controller.dart';

void main() {
  runApp(const MyApp());
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
