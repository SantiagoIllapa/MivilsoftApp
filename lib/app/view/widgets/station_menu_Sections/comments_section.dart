// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/utils/constants.dart';

import '../../../model/Classes/comment.dart';
import '../../../model/Classes/station.dart';

class CommentsSection extends StatefulWidget {
  Station station;
  CommentsSection({super.key, required this.station});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  late bool loading;
  late List<Widget> commentsWidgets = [];
  late List<Comment> comments;
  @override
  void initState() {
    comments = [];
    loading = true;
    _loadComments();
    super.initState();
  }

  void _loadComments() async {
    final response = await widget.station.getComments();
    comments = response as List<Comment>;

    if (!mounted) return;
    setState(() {
      _buildComments();
      loading = false;
    });
  }

  void _buildComments() {
    for (Comment comm in comments) {
      String date = '${comm.date.day}/${comm.date.month}/${comm.date.year}';
      String time = '${comm.date.hour}:${comm.date.minute}';
      commentsWidgets.add(Container(
        decoration: BoxDecoration(
            color: ColorConstant.white,
            border: Border.symmetric(
                horizontal: BorderSide(color: ColorConstant.lightBorderColor))),
        child: ListTile(
          title: Text(
            comm.name,
            style: TextStyle(
                color: ColorConstant.grayColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          subtitle: Text(
            comm.description,
            style: TextStyle(color: ColorConstant.grayColor, fontSize: 14),
          ),
          leading: Iconify(
            Mdi.account_circle,
            color: ColorConstant.grayColor,
            size: 60,
          ),
          trailing: Column(
            children: [
              Text(
                '$date $time',
                style: TextStyle(color: ColorConstant.grayColor, fontSize: 12),
              ),
              SizedBox(width: 75, child: _buildStars(comm.score)),
            ],
          ),
        ),
      ));
    }
    loading = false;
  }

  Widget _buildStars(int score) {
    List<Widget> listStars = [];
    for (var i = 0; i < score; i++) {
      listStars.add(Iconify(
        Mdi.star,
        color: ColorConstant.scoreColor,
        size: 15,
      ));
    }
    while (score < 5) {
      score++;
      listStars.add(Iconify(
        Mdi.star_outline,
        color: ColorConstant.scoreColor,
        size: 13,
      ));
    }
    return Row(
      children: listStars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Comentarios(${comments.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : comments.isEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 75),
                          child: Text(
                            "Aún no existe comentarios de este sitio por favor añadalos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstant.grayColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Iconify(
                                Mdi.view_gallery_outline,
                                color: ColorConstant.lightBorderColor,
                                size: 150,
                              ),
                              SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Iconify(
                                          Ic.round_insert_comment,
                                          size: 50,
                                          color: ColorConstant.lightBorderColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Iconify(
                                          Ic.round_people_alt,
                                          size: 50,
                                          color: ColorConstant.lightBorderColor,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    )
                  : Expanded(child: ListView(children: commentsWidgets))
        ],
      ),
    );
  }
}
