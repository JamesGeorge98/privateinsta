import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';

class PIAppBar extends StatefulWidget implements PreferredSizeWidget {
  final AppBar appBar;

  /// you can add more fields that meet your needs

  const PIAppBar({super.key, required this.appBar});

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  State<PIAppBar> createState() => _PIAppBarState();
}

class _PIAppBarState extends State<PIAppBar> {
  bool iconColor = false;

  Color getTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Instagram",
        style: GoogleFonts.cookie(
          fontSize: 50,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      actions: [
        PITextButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            child: const Icon(
              Icons.favorite_border_rounded,
              size: 30,
            )).iconButton(context),
        PITextButton(
            onPressed: () {
              //Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            child: const Icon(
              AppIcons.messenger,
              size: 25,
            )).iconButton(context),
      ],
    );
  }
}
