import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/discover/discover_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/post/post_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/main_screen/reels/reels_view.dart';
import 'package:privateinsta/src/messages/messages_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/mainscreen';

  static void changePage({required BuildContext context, bool index = true}) {
    context
        .findAncestorStateOfType<_MainScreenState>()!
        .changePageFromOutSide(nextPage: index);
  }

  static void setIshome({
    required BuildContext context,
    bool swipable = false,
  }) {
    context.findAncestorStateOfType<_MainScreenState>()!.setHomePage(swipable);
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _controller;
  late final List<Widget> reels;
  bool swipable = true;

  void changePageFromOutSide({required bool nextPage}) {
    nextPage
        ? _controller.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          )
        : _controller.previousPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
    setState(() {});
  }

  void setHomePage(bool value) {
    swipable = value;
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 1);
    reels = <Widget>[
      const PostScreen(),
      const BottomTabScreens(),
      const MessagesScreen(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: swipable
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: _controller,
      children: reels,
    );
  }
}

class BottomTabScreens extends StatefulWidget {
  const BottomTabScreens({super.key});

  static const String routeName = '/bottomtabscreen';

  static void selectedIndex({required BuildContext context, int index = 0}) {
    context
        .findAncestorStateOfType<_BottomTabScreensState>()!
        .changeIndexFromOutSide(index);
  }

  @override
  State<BottomTabScreens> createState() => _BottomTabScreensState();
}

class _BottomTabScreensState extends State<BottomTabScreens> {
  int _selectedIndex = 0;

  void changeIndexFromOutSide(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const DiscoverScreen(),
    const PostScreen(),
    const ReelsScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              AppIcons.home,
            ),
            label: '',
            activeIcon: Icon(
              AppIcons.homeFilled,
              color:
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.search,
            ),
            label: '',
            activeIcon: Icon(
              AppIcons.search,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.post,
            ),
            label: '',
            activeIcon: Icon(
              AppIcons.post,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.reels,
            ),
            label: '',
            activeIcon: Icon(
              AppIcons.reels,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.profile,
            ),
            label: '',
            activeIcon: Icon(
              AppIcons.profile,
            ),
          ),
        ],
        onTap: (int index) {
          if (index == 2) {
            MainScreen.changePage(context: context, index: false);
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
