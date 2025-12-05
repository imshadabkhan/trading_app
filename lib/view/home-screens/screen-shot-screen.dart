import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/small-top-header.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class ScreenShotScreen extends StatefulWidget {
  const ScreenShotScreen({super.key});

  @override
  State<ScreenShotScreen> createState() => _ScreenShotScreenState();
}

class _ScreenShotScreenState extends State<ScreenShotScreen> {
  @override
  Widget build(BuildContext context) {
    // Responsive width & height
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SmallTopHeader(
              icon: Icon(Icons.arrow_back_ios_sharp,
                  color: ColorConstants.whiteColor, size: screenWidth * .06),
              iconOnTap: () => Get.back(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(children: [
                // Outer container
                Center(
                  child: Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: ColorConstants.blackColor, width: .3),
                    ),
                  ),
                ),
                // Shadow container
                Center(
                  child: Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: ColorConstants.blackColor, width: .3),
                      boxShadow: [
                        BoxShadow(
                            color: ColorConstants.blackColor.withOpacity(.4),
                            blurRadius: 1)
                      ],
                    ),
                  ),
                ),
                // Inner colored container
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.006),
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstants.secandoryColor,
                          blurRadius: 4,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monetization_on,
                              color: ColorConstants.whiteColor),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            "GOLD",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              color: ColorConstants.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Widgets.heightSpaceH5,
            // Chart
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                width: screenWidth * 0.65,
                height: screenWidth * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ColorConstants.primaryColor,
                    width: 3,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  Assets.chart,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Widgets.heightSpaceH5,
            // Prediction container
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03),
              child: Stack(children: [
                Center(
                  child: Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: ColorConstants.blackColor, width: .3),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: ColorConstants.blackColor.withOpacity(.4),
                            blurRadius: 1)
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.006),
                    height: screenHeight * 0.235,
                    width: screenWidth * 0.88,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstants.grayBorderColor,
                          blurRadius: 4,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenHeight * 0.008),
                          decoration: BoxDecoration(
                            color: ColorConstants.secandoryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Prediction",
                            style: TextStyle(
                              color: ColorConstants.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                        ),
                        Widgets.heightSpaceH4,
                        Text(
                          "Bitcoin continues to show strong upward momentum as market confidence grows. Analysts expect volatility, but long-term sentiment remains bullish for major investors. Traders are watching key resistance levels closely for the next breakout.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: screenWidth * 0.025,
                              color: ColorConstants.blackColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Widgets.heightSpaceH5
          ],
        ),
      ),
    );
  }
}
