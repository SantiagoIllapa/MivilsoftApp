import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/uil.dart';

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

    return Drawer(
      elevation: 2,
      width: menuWidth,
      child: Container(
        padding: EdgeInsets.only(top: menuPaddingTop),
        child: Column(children: [
          ListTile(
            leading: const Iconify(
              Ri.account_circle_fill,
              size: 50,
              color: Color(0xFF555555),
            ),
            title: Text(
              "Perfil",
              style: TextStyle(
                  color: const Color(0xFF555555), fontSize: acountTextSize),
            ),
          ),
          const Divider(color: Color(0xFF555555)),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Iconify(
                    Ri.star_fill,
                    size: 24,
                    color: Color(0xFF555555),
                  ),
                  title: Text(
                    "Favoritos",
                    style: TextStyle(
                        color: const Color(0xFF555555), fontSize: textSize),
                  ),
                ),
                ListTile(
                  leading: const Iconify(
                    Ri.question_fill,
                    size: 24,
                    color: Color(0xFF555555),
                  ),
                  title: Text(
                    "Preguntas frecuentes",
                    style: TextStyle(
                        color: const Color(0xFF555555), fontSize: textSize),
                  ),
                ),
                ListTile(
                  leading: const Iconify(
                    Ri.file_list_3_fill,
                    size: 24,
                    color: Color(0xFF555555),
                  ),
                  title: Text(
                    "Terminos y condiciones",
                    style: TextStyle(
                        color: const Color(0xFF555555), fontSize: textSize),
                  ),
                ),
                ListTile(
                  leading: const Iconify(
                    Ri.phone_fill,
                    size: 24,
                    color: Color(0xFF555555),
                  ),
                  title: Text(
                    "Contactar",
                    style: TextStyle(
                        color: const Color(0xFF555555), fontSize: textSize),
                  ),
                ),
                ListTile(
                  leading: const Iconify(
                    Uil.cog,
                    size: 24,
                    color: Color(0xFF555555),
                  ),
                  title: Text(
                    "Configuración",
                    style: TextStyle(
                        color: const Color(0xFF555555), fontSize: textSize),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
