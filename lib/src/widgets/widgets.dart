import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';

class CustomWidgets {
  CustomWidgets();
  Widget visibleIcons({bool visiable = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: (ImageIcon(
        AssetImage(
          "assets/icons/${visiable ? "visiblityicon" : "invisiblityicon"}.webp",
          
        ),
        color: visiable ? AppColors.blue :  null,
      )),
    );
  }
}
