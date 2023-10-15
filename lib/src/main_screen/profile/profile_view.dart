import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/widgets/bottom_sheets.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/display_picture.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profilescreen';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late CustomWidgets customWidget;

  @override
  void initState() {
    super.initState();
    customWidget = CustomWidgets(context: context);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      MainScreen.setIshome(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: PITextButton(
          onPressed: () {
            BottomTabScreens.selectedIndex(context: context, index: 1);
            //Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
          child: const Row(
            children: <Widget>[
              Text(
                '_james_george_',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 25,
              ),
            ],
          ),
        ).iconButton(context),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PITextButton(
            onPressed: () {
              MainScreen.changePage(context: context, index: false);
              //Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            child: const Icon(
              AppIcons.post,
              size: 25,
            ),
          ).iconButton(context),
          PITextButton(
            onPressed: () {
              //Navigator.restorablePushNamed(context, SettingsView.routeName);
              BottomSheets(context: context).menuBottomSheets();
            },
            child: const Icon(
              Icons.menu,
              size: 30,
            ),
          ).iconButton(context),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrollable) => <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height * .11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const DisplayPicture(avatarSize: 50),
                          const SizedBox().sizedWidth(),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customWidget.headingSubHeading(
                                  heading: '10',
                                  subheading: 'Posts',
                                ),
                                customWidget.headingSubHeading(
                                  heading: '100M',
                                  subheading: 'Followers',
                                ),
                                customWidget.headingSubHeading(
                                  heading: '200',
                                  subheading: 'Following',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox().sizedHeight(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('James George'),
                        Text('Hiding Behind onces and zero'),
                        Text('Lost In Japan'),
                      ],
                    ),
                    const SizedBox().sizedHeight(),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: PIElevatedButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Edit Profile'),
                            ),
                          ).sameThemeButton(context),
                        ),
                        const SizedBox().sizedWidth(width: 10),
                        Expanded(
                          child: PIElevatedButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Share Profile'),
                            ),
                          ).sameThemeButton(context),
                        ),
                      ],
                    ),
                    //for (var i = 0; i <= 10; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LimitedBox(
                        maxHeight: MediaQuery.of(context).size.height * .12,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) =>
                              customWidget.storyHighligths(
                            isHighlight: index == 2 ? true : false,
                          ),
                          itemCount: 3,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox().sizedWidth(width: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Column(
            children: <Widget>[
              TabBar(
                labelPadding: const EdgeInsets.only(bottom: 10),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                indicatorColor: Theme.of(context).primaryColorLight,
                splashBorderRadius: BorderRadius.circular(0),
                splashFactory: NoSplash.splashFactory,
                padding: const EdgeInsets.only(top: 10),
                tabs: const <Widget>[
                  Icon(AppIcons.grid),
                  Icon(AppIcons.reels),
                  Icon(AppIcons.tag),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: AppColors.darkFieldColor,
                          child: Center(child: Text('$index')),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: Dimensions.igtv,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: AppColors.darkFieldColor,
                          child: Center(child: Text('$index')),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: AppColors.darkFieldColor,
                          child: Center(child: Text('$index')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
