import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/bottom-nav.dart';
import 'package:trading_app/view/home-screens/chat-screen.dart';
import 'package:trading_app/view/home-screens/home-screen.dart';
import 'package:trading_app/view/home-screens/package-screen.dart';
import 'package:trading_app/view/home-screens/result_screen.dart';
import 'package:trading_app/view/home-screens/tutorial-screen.dart';

class MainNavController extends StatefulWidget {
  const MainNavController({super.key});

  @override
  State<MainNavController> createState() => _MainNavControllerState();
}

class MainNav {
  static late _MainNavControllerState controller;
}

class _MainNavControllerState extends State<MainNavController> {
  int bottomNavIndex = 0;
  bool showBottomNav = true;

  final List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    PackageScreen(),
    ResultScreen(),
    TutorialScreen(),
  ];

  @override
  void initState() {
    super.initState();
    MainNav.controller = this; // 👈 store instance here
  }

  void changeTab(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  void hideBottomNav() {
    if (showBottomNav) {
      setState(() {
        showBottomNav = false;
      });
    }
  }

  void showBottomNavBar() {
    if (!showBottomNav) {
      setState(() {
        showBottomNav = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: showBottomNav
          ? AppBottomNav(
              currentIndex: bottomNavIndex,
              onTap: (value) {
                setState(() {
                  bottomNavIndex = value;
                });
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
