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

  @override
  void initState() {
    loading = true;
    super.initState();
    // widget.stationController.commentCallback = _refresh;
  }

  void _buildComments() {
    for (Comment comm in widget.station.comments) {
      commentsWidgets.add(ListTile(
        title: Text(comm.name),
        subtitle: Text(comm.description),
        leading: Iconify(Mdi.account_circle, color: ColorConstant.grayColor),
        trailing: Column(
          children: [Text(comm.date.toString()), _buildScore(comm.score)],
        ),
      ));
    }
    loading = false;
  }

  Widget _buildScore(int score) {
    Row rowStars = Row();
    List<Iconify> listStars = [];
    int rest = score;
    for (var i = 0; i < score; i++) {
      listStars.add(Iconify(
        Mdi.star,
        color: ColorConstant.scoreColor,
      ));
    }
    while (score < 5) {
      listStars.add(Iconify(
        Mdi.star_outline,
        color: ColorConstant.scoreColor,
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
              "Comentarios(${commentsWidgets.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : commentsWidgets.isEmpty
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
