import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/sizedbox.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = "/profilescreen";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CustomWidgets customWidget = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "_james_george_",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            PITextButton(
                onPressed: () {
                  //Navigator.restorablePushNamed(context, SettingsView.routeName);
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 25,
                )).iconButton(context),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        actions: [
          PITextButton(
              onPressed: () {
                //Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              child: const Icon(
                AppIcons.post,
                size: 25,
              )).iconButton(context),
          PITextButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              child: const Icon(
                Icons.menu,
                size: 30,
              )).iconButton(context),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * .12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customWidget.displayPictureView(
                    context: context, isStroy: true, isStoryViwed: false),
                PISizedBox().sizedWidth(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customWidget.headingSubHeading(
                          heading: "10", subheading: "Posts"),
                      customWidget.headingSubHeading(
                          heading: "100M", subheading: "Followers"),
                      customWidget.headingSubHeading(
                          heading: "200", subheading: "Following")
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
