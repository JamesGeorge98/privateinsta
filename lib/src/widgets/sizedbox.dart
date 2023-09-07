import 'package:flutter/material.dart';

class PISizedBox {
  PISizedBox();

  Widget sizedHeight({double height = 40}) {
    return SizedBox(height: height);
  }

   Widget sizedWidth({double width = 40}) {
    return SizedBox(width: width);
  }
}
