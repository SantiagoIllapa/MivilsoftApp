import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:mivilsoft_app/utils/constants.dart';

// ignore: must_be_immutable
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double menuWidth = screenWidth * 0.7;
    double acountTextSize = screenWidth / 25;
    double textSize = screenWidth / 35;
    double menuPaddingTop = screenHeight * 0.05;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      menuWidth = screenWidth * 0.3;
      acountTextSize = screenWidth / 70;
      textSize = screenWidth / 85;
      menuPaddingTop = screenHeight * 0.10;
    }
    Widget menuItem(String titleText, String icon, Function func) {
      return ListTile(
        leading: Iconify(
          icon,
          size: 24,
          color: ColorConstant.white,
        ),
        title: Text(
          titleText,
          style: TextStyle(
              color: ColorConstant.white,
              fontSize: textSize,
              fontFamily: "Roboto"),
        ),
        onTap: () {
          func();
        },
      );
    }

    return Drawer(
      elevation: 2,
      width: menuWidth,
      backgroundColor: ColorConstant.appBackColor,
      child: Container(
        padding: EdgeInsets.only(top: menuPaddingTop),
        child: Column(children: [
          ListTile(
            leading: Iconify(
              Ri.account_circle_fill,
              size: 50,
              color: ColorConstant.white,
            ),
            title: Text(
              "Perfil",
              style: TextStyle(
                  color: ColorConstant.white,
                  fontSize: acountTextSize,
                  fontFamily: "Roboto"),
            ),
            onTap: () {},
          ),
          Divider(color: ColorConstant.white),
          Expanded(
            child: ListView(
              children: [
                menuItem("Favoritos", Ri.star_fill, () {}),
                menuItem("Preguntas frecuentes", Ri.question_fill, () {}),
                menuItem("Terminos y condiciones", Ri.file_list_3_fill, () {}),
                menuItem("Contactar", Ri.phone_fill, () {}),
                menuItem("Configuración", Ri.settings_3_fill, () {}),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
