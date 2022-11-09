// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 190, 19),
        title: const Text('Información'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(0, 255, 255, 255)),
          child: Column(children: [
            Card(
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
                padding: EdgeInsets.all(100),
                child: Text('Hola'),
              ),
            )
          ]),
        ))
      ]),
    );
  }
}
