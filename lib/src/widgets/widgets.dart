import 'package:flutter/material.dart';

class CustomWidgets {
  CustomWidgets();
  Widget visibleIcons() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: (Image.asset(
        "assets/icons/visiblityicon.webp",
        fit: BoxFit.contain,
      )),
    );
  }
}
