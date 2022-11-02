import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/Ri.dart';
import 'package:iconify_flutter/icons/uil.dart';

// ignore: must_be_immutable
class MainMenu extends StatelessWidget {
  double? screenWidth;
  MainMenu({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    double menuWidth = screenWidth! * 0.7;
    double acountTextSize = screenWidth! / 25;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      menuWidth = screenWidth! * 0.2;
      if (acountTextSize > menuWidth) {
        print("hola");
        menuWidth = acountTextSize + 5;
      }
      acountTextSize = screenWidth! / 70;
    }
    return Drawer(
      width: menuWidth,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(runSpacing: 15, children: [
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
          ListTile(
            leading: const Iconify(
              Ri.star_fill,
              size: 24,
              color: Color(0xFF555555),
            ),
            title: Text(
              "Favoritos",
              style: TextStyle(
                  color: const Color(0xFF555555), fontSize: acountTextSize),
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
                  color: const Color(0xFF555555), fontSize: acountTextSize),
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
                  color: const Color(0xFF555555), fontSize: acountTextSize),
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
                  color: const Color(0xFF555555), fontSize: acountTextSize),
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
                  color: const Color(0xFF555555), fontSize: acountTextSize),
            ),
          ),
        ]),
      ),
    );
  }
}
