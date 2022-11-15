// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mivilsoft_app/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class CommentsSection extends StatelessWidget {
  Station station;
  CommentsSection({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Comentarios(${station.comments.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: const [],
          ))
        ],
      ),
    );
  }
}
