import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';

class PIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  /// you can add more fields that meet your needs

  const PIAppBar({super.key, required this.appBar});

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
        IconButton(
          onPressed: () {},
          // hoverColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          // splashColor: Colors.transparent,

          style: ButtonStyle(
            overlayColor: const MaterialStatePropertyAll(Colors.amber),
            iconColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xff013972);
                }
                return Colors.blue.shade800;
              },
            ),
          ),
          icon: const Icon(
            Icons.favorite_border_rounded,
            color: Colors.red,
            size: 40,
          ),
        ),
        const Icon(
          AppIcons.facbookMessanger,
          size: 40,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
