import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
import 'package:privateinsta/src/widgets/bottom_sheets.dart';
import 'package:privateinsta/src/widgets/extensions.dart';

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
}

class PIPhoneNumberTextField extends StatefulWidget {
  const PIPhoneNumberTextField({
    super.key,
    this.hint,
    this.suffixIcon,
    this.textEditingController,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
  });

  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final void Function()? onEditingComplete;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PIPhoneNumberTextField> createState() => _PIPhoneNumberTextFieldState();
}

class _PIPhoneNumberTextFieldState extends State<PIPhoneNumberTextField> {
  PhoneNumber? phoneNumber;

  @override
  void initState() {
    phoneNumber ??= PhoneNumber.india();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      validator: widget.validator ??
          (String? value) {
            if (value.isNull || value!.isEmpty) {
              return 'Phone number cannot be empty';
            }
            if (value.length < (phoneNumber?.countryDigitMinLength ?? 0) ||
                value.length >
                    (phoneNumber?.countryDigitMaxLength ??
                        phoneNumber?.countryDigitMinLength ??
                        10)) {
              return 'Enter a valid number';
            }
            return null;
          },
      keyboardType: TextInputType.number,
      onChanged: (String value) async {
        phoneNumber?.phoneNumber = value;
        widget.onChanged?.call(phoneNumber!);
      },
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
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
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
                onTap: () async {
                  final PhoneNumber? number =
                      await BottomSheets(context: context)
                          .countryCodeBottomSheets();
                  if (number != null) {
                    phoneNumber = number;
                    setState(() {});
                  }
                },
                child: Text(
                  '${phoneNumber!.countryCode!}  ${phoneNumber!.countryDialCode}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
