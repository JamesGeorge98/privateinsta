import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/discover/discover_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/post/post_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/main_screen/reels/reels_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/mainscreen';

  static void selectedIndex({required BuildContext context, int index = 0}) {
    context
        .findAncestorStateOfType<_MainScreenState>()!
        .changeIndexFromOutSide(index);
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 3;

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
