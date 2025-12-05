import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/bottom-nav.dart';
import 'package:trading_app/view/home-screens/home-screen.dart';
import 'package:trading_app/view/home-screens/package-screen.dart';
import 'package:trading_app/view/home-screens/result-screen.dart';
import 'package:trading_app/view/home-screens/signal-screen.dart';
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

  final List<Widget> screens = [
    HomeScreen(),
    SignalScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: bottomNavIndex,
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
    );
  }
}
