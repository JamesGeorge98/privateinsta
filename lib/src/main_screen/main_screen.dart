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

  static const routeName = '/mainscreen';

  static void selectedIndex({required BuildContext context, int index = 0}) {
    context
        .findAncestorStateOfType<_MainScreenState>()!
        .changeIndexFromOutSide();
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _controller;
  late final List<Widget> reels;

  changeIndexFromOutSide() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Easing.linear);
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController();
    reels = [const BottomTabScreens(), const MessagesScreen()];
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
      scrollDirection: Axis.horizontal,
      controller: _controller,
      children: reels,
    );
  }
}

class BottomTabScreens extends StatefulWidget {
  const BottomTabScreens({super.key});

  static const routeName = '/bottomtabscreen';

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

  changeIndexFromOutSide(int index) {
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.home,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.homeFilled,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.search,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.post,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.post,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.reels,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.reels,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.profile,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.profile,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
