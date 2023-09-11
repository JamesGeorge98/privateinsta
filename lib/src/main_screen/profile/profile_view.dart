import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
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
  late CustomWidgets customWidget;

  @override
  void initState() {
    customWidget = CustomWidgets(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrollable) => [
            SliverAppBar(
              title: PITextButton(
                  onPressed: () {
                    //Navigator.restorablePushNamed(context, SettingsView.routeName);
                  },
                  child: const Row(
                    children: [
                      Text(
                        "_james_george_",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 25,
                      ),
                    ],
                  )).iconButton(context),
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
                      Navigator.restorablePushNamed(
                          context, SettingsView.routeName);
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    )).iconButton(context),
              ],
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height * .12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customWidget.displayPictureView(
                        isStroy: true, isStoryViwed: false),
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
              PISizedBox().sizedHeight(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("James George"),
                  Text("Hiding Behind onces and zero"),
                  Text("Lost In Japan")
                ],
              ),
              PISizedBox().sizedHeight(height: 20),
              Row(
                children: [
                  Expanded(
                    child: PIElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Edit Profile"),
                        )).sameThemeButton(context),
                  ),
                  PISizedBox().sizedWidth(width: 10),
                  Expanded(
                    child: PIElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Share Profile"),
                        )).sameThemeButton(context),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: LimitedBox(
                    maxHeight: MediaQuery.of(context).size.height * .12,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            customWidget.storyHighligths(
                                isHighlight: index == 2 ? true : false),
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) =>
                            PISizedBox().sizedWidth(width: 5)),
                  )),
              PISizedBox().sizedHeight(height: 30),
              const Expanded(child: ProfileTabBar())
            ]),
          ),
        ),
      ),
    );
  }
}

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  State<ProfileTabBar> createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelPadding: const EdgeInsets.only(bottom: 10),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
          indicatorColor: Theme.of(context).primaryColorLight,
          splashBorderRadius: BorderRadius.circular(0),
          splashFactory: NoSplash.splashFactory,
          tabs: const [
            Icon(AppIcons.grid),
            Icon(AppIcons.reels),
            Icon(AppIcons.tag)
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              Expanded(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: AppColors.textFieldColorDark,
                        child: Center(child: Text('$index')),
                      );
                    }),
              ),
              Expanded(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: Dimensions.igtv),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: AppColors.textFieldColorDark,
                        child: Center(child: Text('$index')),
                      );
                    }),
              ),
              Expanded(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: AppColors.textFieldColorDark,
                        child: Center(child: Text('$index')),
                      );
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
