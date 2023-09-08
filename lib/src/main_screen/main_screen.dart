import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: PITextButton(
              onPressed: () {},
              child: const Icon(
                AppIcons.homeIcon,
              ),
            ).iconButton(context),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: PITextButton(
              onPressed: () {},
              child: const Icon(
                AppIcons.searchIcon,
              ),
            ).iconButton(context),
            label: "",
            activeIcon: const Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.postIcon,
            ),
            label: "",
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.reelsIcon,
            ),
            label: "",
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              AppIcons.profileIcon,
            ),
            label: "",
            activeIcon: Icon(
              Icons.home,
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
