import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: CustomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          iconSize: 33,

          borderRadius: const Radius.circular(25),
          backgroundColor: const Color(0xff4E1A6F),
          elevation: 10,

          selectedColor: Colors.orange,
          unSelectedColor: Colors.white,

          items: [
            CustomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/home (2).png",
                      height: 18, color: currentIndex == 0 ? Colors.orange : Colors.white),
                  const SizedBox(height: 4),
                  Text("Home",
                      style: TextStyle(
                          color: currentIndex == 0 ? Colors.orange : Colors.white,
                          fontSize: 8)),
                ],
              ),
            ),

            CustomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset("assets/images/Signals (1).png",
                      height: 18, color: currentIndex == 1 ? Colors.orange : Colors.white),
                  const SizedBox(height: 4),
                  Text("Signals",
                      style: TextStyle(
                          color: currentIndex == 1 ? Colors.orange : Colors.white,
                          fontSize: 8)),
                ],
              ),
            ),

            CustomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset("assets/images/package.png",
                      height: 18, color: currentIndex == 2 ? Colors.orange : Colors.white),
                  const SizedBox(height: 4),
                  Text("Package",
                      style: TextStyle(
                          color: currentIndex == 2 ? Colors.orange : Colors.white,
                          fontSize: 8)),
                ],
              ),
            ),

            CustomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset("assets/images/news.png",
                      height: 18, color: currentIndex == 3 ? Colors.orange : Colors.white),
                  const SizedBox(height: 4),
                  Text("Result",
                      style: TextStyle(
                          color: currentIndex == 3 ? Colors.orange : Colors.white,
                          fontSize: 8)),
                ],
              ),
            ),

            CustomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset("assets/images/wallet.png",
                      height: 18, color: currentIndex == 4 ? Colors.orange : Colors.white),
                  const SizedBox(height: 4),
                  Text("Tutorial",
                      style: TextStyle(
                          color: currentIndex == 4 ? Colors.orange : Colors.white,
                          fontSize: 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
