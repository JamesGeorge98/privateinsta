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
  const PIElevatedButton({
    super.key,
    required super.onPressed,
    required super.child,
  });

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
