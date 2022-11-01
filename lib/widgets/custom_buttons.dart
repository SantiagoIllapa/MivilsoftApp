// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CustomIconButton extends StatelessWidget {
  String? icon;
  Widget? customIcon;
  Function? funct;
  double? size;
  String? heroTag;
  CustomIconButton({
    Key? key,
    this.icon,
    this.customIcon,
    required this.size,
    required this.funct,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    Widget iconWidget = const Iconify(
      Ic.round_broken_image,
      color: Color(0xFFA40E0E),
    );
    if (icon != null) {
      iconWidget = Iconify(
        icon!,
        color: const Color(0xFF555555),
        size: size! / 2,
      );
    }
    if (customIcon != null) {
      iconWidget = customIcon!;
    }

    return (Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                largeSizeConstraints:
                    BoxConstraints.tightFor(width: size, height: size))),
        child: FloatingActionButton.large(
          heroTag: heroTag,
          onPressed: () {
            funct;
          },
          backgroundColor: const Color(0xffF9F9F7),

          // elevation: 0.5,
          child: iconWidget,
        )));
  }
}
