import 'package:conexus/screens/Home/home_screen.dart';
import 'package:conexus/screens/calls/calls_screen.dart';
import 'package:conexus/screens/location/location_screen.dart';
import 'package:conexus/screens/profile/profile_screen.dart';
import 'package:conexus/screens/translate/translate_screen.dart';
import 'package:conexus/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    LocationScreen(),
    TranslateScreen(),
    CallsScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String activeIconPath) {
    Color backgroundColor = Colors.white.withOpacity(0.2);

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          activeIconPath,
        ),
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(161, 113, 218, 1),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavItem(AppIcons.homeIcon, AppIcons.homeIcon),
          _buildNavItem(AppIcons.locationIcon, AppIcons.selectedLocationIcon),
          _buildNavItem(AppIcons.translateIcon, AppIcons.selectedTranslateIcon),
          _buildNavItem(AppIcons.callIcon, AppIcons.selectedCallIcon),
          _buildNavItem(AppIcons.profile2Icon, AppIcons.profile2Icon),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(161, 113, 218, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
