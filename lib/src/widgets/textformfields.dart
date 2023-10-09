import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';

class PITextFormField {
  PITextFormField({
    this.textEditingController,
    this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
  });
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final bool obscureText;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  String? Function(String?)? validator;

  Widget basicInput() {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusColor: AppColors.transparent,
        hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        hintText: hint,
        //suffixIconConstraints: const BoxConstraints(maxWidth: 100),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
