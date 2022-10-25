import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mivilsoft_app/app/ui/routes/routes.dart';
import 'package:mivilsoft_app/app/ui/screens/request_permission/request_permission_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({Key? key}) : super(key: key);

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _controller.onStatusChanged.listen((status) {
      if (status == PermissionStatus.granted) {
        Navigator.pushReplacementNamed(context, Routes.HOME);
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text("Permitir Uso"),
          onPressed: () {
            _controller.request();
          },
        ),
      )),
    );
  }
}
