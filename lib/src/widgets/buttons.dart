import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';

class PITextButton extends TextButton {
  const PITextButton({
    super.key,
    required super.onPressed,
    required super.child,
  });

  Widget basic() {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color(0xff013972);
            }
            return Colors.blue.shade800;
          },
        ),
        overlayColor:
            MaterialStateColor.resolveWith((states) => AppColors.transparent),
      ),
      child: child!,
    );
  }

  Widget iconButton(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).iconTheme.color?.withOpacity(0.5) ??
                  AppColors.black.withOpacity(0.5);
            }
            return Theme.of(context).iconTheme.color ?? AppColors.grey;
          },
        ),
        overlayColor:
            MaterialStateColor.resolveWith((states) => AppColors.transparent),
      ),
      child: child!,
    );
  }
}

class PIElevatedButton extends ElevatedButton {
  const PIElevatedButton(
      {super.key, required super.onPressed, required super.child, super.style});

  Widget basic(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          maximumSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width * .9,
              MediaQuery.of(context).size.width * .1))),
      child: child!,
    );
  }

  Widget sameThemeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          maximumSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.1)),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.textFieldColorDark),
          foregroundColor: const MaterialStatePropertyAll(AppColors.white),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      child: child!,
    );
  }

  Widget expanded(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.width * .1))),
      child: child!,
    );
  }
}

class PIOutlinedButton extends OutlinedButton {
  const PIOutlinedButton(
      {super.key, required super.onPressed, required super.child});

  Widget basic(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size.zero),
          maximumSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width * .9,
              MediaQuery.of(context).size.width * .1)),
          padding:
              const MaterialStatePropertyAll(EdgeInsets.fromLTRB(10, 8, 10, 8)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: child!,
    );
  }
}
