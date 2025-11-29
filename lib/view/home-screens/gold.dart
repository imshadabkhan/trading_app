import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/widgets/top-header.dart';
import 'package:trading_app/core/widgets/bottom-nav.dart';
import 'package:trading_app/view/authentication/controller/tab-controller.dart';

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  final MarketTabController tabController = Get.put(MarketTabController());
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff4E1A6F),
        elevation: 0,
        title: const Text(
          "Gold",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
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
