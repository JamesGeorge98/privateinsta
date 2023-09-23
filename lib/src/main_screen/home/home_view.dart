import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/notification/notification_view.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CustomWidgets customWidget;

  @override
  void initState() {
    customWidget = CustomWidgets(context: context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainScreen.setIshome(context: context, swipable: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrollable) => [
        SliverAppBar(
          floating: true,
          title: Text(
            "Instagram",
            style: GoogleFonts.cookie(
              fontSize: 35,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          actions: [
            PITextButton(
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, NotificationScreen.routeName);
                },
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 30,
                )).iconButton(context),
            PITextButton(
                onPressed: () {
                  MainScreen.changePage(context: context);
                },
                child: const Icon(
                  AppIcons.messenger,
                  size: 25,
                )).iconButton(context),
          ],
        )
      ],
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: LimitedBox(
                maxHeight: MediaQuery.of(context).size.height * .10,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        customWidget.displayPictureView(
                            index: index,
                            isStroy: index == 0 ? false : true,
                            isStoryViwed: true),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox().sizedWidth(width: 5)),
              )),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const SizedBox().sizedHeight(height: 20),
              itemCount: 5,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? customWidget.instaPostFeedView()
                    : customWidget.instaReelsFeedView();
              }),
        ],
      ),
    );
  }
}
