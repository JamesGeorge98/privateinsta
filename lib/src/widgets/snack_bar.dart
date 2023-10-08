import 'package:flutter/material.dart';

class PISanckBar extends SnackBar {
  const PISanckBar({required super.content, super.key});

  void showSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: content,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBarWithButton(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: const Text('Hi, Flutter developers'),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
