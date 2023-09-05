import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';

class PITextFormField {
  PITextFormField({this.textEditingController, this.hint, this.suffixIcon});
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;

  Widget basicInput() {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        fillColor: AppColors.textFieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        hintText: hint,
        suffixIconConstraints: const BoxConstraints(maxWidth: 30),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
