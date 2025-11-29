import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/bottom-nav.dart';
import 'package:trading_app/view/home-screens/home-screen.dart';
import 'package:trading_app/view/home-screens/package-screen.dart';
import 'package:trading_app/view/home-screens/result-screen.dart';
import 'package:trading_app/view/home-screens/singnals-screen.dart';
import 'package:trading_app/view/home-screens/tutorial-screen.dart';



class MainNavController extends StatefulWidget {
  const MainNavController({super.key});

  @override
  State<MainNavController> createState() => _MainNavControllerState();
}

class _MainNavControllerState extends State<MainNavController> {
  int index = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    SignalScreen(),
    PackageScreen(),
    ResultScreen(),
    TutorialScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: AppBottomNav(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
