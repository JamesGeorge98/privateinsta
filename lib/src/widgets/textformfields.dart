import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
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
    this.onTapCountryCode,
    this.selectCountryCode,
  });
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final bool obscureText;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  Widget? prefix;
  String? Function(String?)? validator;
  void Function()? onTapCountryCode;
  PhoneNumber? selectCountryCode;

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

  Widget phoneNumberWithCountryCode(
    BuildContext context,
  ) {
    selectCountryCode ??= PhoneNumber.india();
    return TextFormField(
      onEditingComplete: onEditingComplete,
      controller: textEditingController,
      validator: validator,
      keyboardType: TextInputType.phone,
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
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          padding: const EdgeInsets.only(right: 30),
          margin: const EdgeInsets.only(
            right: 30,
            left: 20,
            top: 7,
            bottom: 7,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: onTapCountryCode ??
                    () async {
                      final int? a = await BottomSheets(context: context)
                          .countryCodeBottomSheets();
                      selectCountryCode =
                          PhoneNumber.countriesPhoneNumberCodes[a ?? 0];
                    },
                child: Text(
                  selectCountryCode!.countryCode!,
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
