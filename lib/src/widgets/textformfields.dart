import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/country_code.dart';
import 'package:privateinsta/src/widgets/bottom_sheets.dart';

class PITextFormField {
  PITextFormField({
    this.textEditingController,
    this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.prefix,
  });
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final bool obscureText;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  Widget? prefix;
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

  Widget phoneNumberWithCountryCode(BuildContext context) {
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
        prefixIcon: Container(
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.red)),
          ),
          padding: const EdgeInsets.only(right: 30),
          margin: const EdgeInsets.only(
            right: 30,
            left: 20,
            top: 5,
            bottom: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  final int? a = await BottomSheets(context: context)
                      .countryCodeBottomSheets();
                  // print(CountryCode.countryData[a ?? 0].countryName);
                },
                child: const Text(
                  '214',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
