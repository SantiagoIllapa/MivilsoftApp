// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:mivilsoft_app/utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  String? icon;
  Widget? customIcon;
  Function? funct;
  double? size;
  CustomIconButton({
    Key? key,
    this.icon,
    this.customIcon,
    required this.size,
    required this.funct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    Widget iconWidget = Iconify(
      Ic.round_broken_image,
      color: ColorConstant.unavailable,
    );
    if (icon != null) {
      iconWidget = Iconify(
        icon!,
        color: ColorConstant.grayColor,
        size: size! / 2,
      );
    }
    if (customIcon != null) {
      iconWidget = customIcon!;
    }

    return (Container(
      width: size!,
      height: size!,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size!),
          color: ColorConstant.buttonBackColor,
          border: Border.all(color: ColorConstant.borderColor)),
      child: IconButton(
        icon: iconWidget,
        onPressed: () {
          funct!();
        },
      ),
    ));
  }
}
// data: Theme.of(context).copyWith(
//             floatingActionButtonTheme: FloatingActionButtonThemeData(
//                 largeSizeConstraints:
//                     BoxConstraints.tightFor(width: size, height: size))),