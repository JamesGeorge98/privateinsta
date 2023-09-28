import 'package:flutter/material.dart';

class PITextStyle {
  PITextStyle();

  TextStyle headerTextStyle() {
    return const TextStyle(fontSize: 23, fontWeight: FontWeight.bold);
  }

  TextStyle bodyTextStyle({double size = 14}) {
    return TextStyle(fontSize: size, color: Colors.white.withOpacity(0.5));
  }
}
