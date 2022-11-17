// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:mivilsoft_app/app/model/Classes/station.dart';
import 'package:mivilsoft_app/utils/constants.dart';
import 'package:iconify_flutter/icons/ion.dart';

class PicturesSection extends StatefulWidget {
  Station station;
  PicturesSection({super.key, required this.station});
  @override
  State<PicturesSection> createState() => _PicturesSectionState();
}

class _PicturesSectionState extends State<PicturesSection> {
  late bool loading;
  late List<Widget> images;
  @override
  void initState() {
    loading = widget.station.loading["pictures"]!;
    images = widget.station.pictures;
    super.initState();
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
              "Fotos(${images.length})",
              style: TextStyle(
                  color: ColorConstant.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : images.isEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 75),
                          child: Text(
                            "Aún no existe fotografías de este sitio por favor añadalas",
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
                                          Ic.round_ev_station,
                                          size: 50,
                                          color: ColorConstant.lightBorderColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Iconify(
                                          Ion.car_sport,
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
                  : Expanded(
                      child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImagePage(images[index]),
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: widget.station.pictures[index]),
                          ),
                        );
                      },
                      itemCount: images.length,
                    ))
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final Widget image;
  const ImagePage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(child: image),
    );
  }
}
