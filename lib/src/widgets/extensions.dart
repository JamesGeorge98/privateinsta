import 'package:flutter/material.dart';

extension SizedHeight on SizedBox {
  SizedBox sizedHeight({double height = 20}) => SizedBox(height: height);
}

extension SizedWidth on SizedBox {
  SizedBox sizedWidth({double width = 20}) => SizedBox(width: width);
}

// String Extension
extension CheckNull on String? {
  bool get isNull {
    return this == null;
  }
}

extension EmailValidator on String {
  bool get isValidEmail {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }
}
