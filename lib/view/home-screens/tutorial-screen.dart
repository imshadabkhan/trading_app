import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/small-top-header.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallTopHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tutorial",
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // responsive font
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Watch your video tutorial and learn about\nTrading",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(Assets.tutorial1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            TutorialCard(
              image: Assets.tutorial1,
              title: "Introduction to Trading",
              subtitle: "By Live Trade Flow",
            ),
            TutorialCard(
              image: Assets.tutorial2,
              title: "Fundamental of Analysis",
              subtitle: "By Live Trade Flow",
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
