import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/discover/discover_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/post/post_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/main_screen/reels/reels_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4;

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
        items: [
          const BottomNavigationBarItem(
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
            icon: PITextButton(
              onPressed: () {},
              child: const Icon(
                AppIcons.search,
              ),
            ).iconButton(context),
            label: "",
            activeIcon: const Icon(
              AppIcons.search,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.post,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.post,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.reels,
            ),
            label: "",
            activeIcon: Icon(
              AppIcons.reels,
            ),
          ),
          const BottomNavigationBarItem(
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
