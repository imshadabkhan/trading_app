import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/routes/app_routes.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/top-header.dart';
import 'package:get/get.dart';
import 'package:trading_app/view/authentication/controller/tab-controller.dart';
import 'package:trading_app/view/home-screens/previous-result.dart';
import 'package:trading_app/view/home-screens/screen-shot-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MarketTabController tabController = Get.put(MarketTabController());

  // ---------------- FOREX UI ----------------
  Widget buildForexUI(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    final flagImages = [
      Assets.ukImage,
      Assets.usaImage,
      Assets.ellipse1101,
      Assets.euroPng1,
    ];

    final pairNames = ["GBP/USD", "USA/USD", "JPY/USD", "EUR/USD"];

    return Column(
      children: [
        Transform.translate(
          offset: Offset(0, -MediaQuery.of(context).size.height * 0.055),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: ColorConstants.grayFillColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Texts.textBold("Top Pair Analysis",
                    size: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = (constraints.maxWidth - 6) / 2;
              double itemHeight = itemWidth / 1.95;
              double gridHeight = itemHeight * 2 + 70;

              return SizedBox(
                height: gridHeight,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth * 0.015,
                    crossAxisSpacing: screenWidth * 0.015,
                    childAspectRatio: 1.95,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(ScreenShotScreen()),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      flagImages[index],
                                      height: screenWidth * 0.09,
                                      width: screenWidth * 0.09,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Texts.textBold(pairNames[index],
                                      size: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.whiteColor),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: ColorConstants.whiteColor,
                                size: screenWidth * 0.035),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCryptoUI(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    final flagImages = [
      Assets.binance,
      Assets.ethereum,
      Assets.binance,
      Assets.binance,
    ];

    final pairNames = ["BTC", "ETHEREUM", "BNB", "XRP"];

    return Column(
      children: [
        Transform.translate(
          offset: Offset(0, -MediaQuery.of(context).size.height * 0.055),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: ColorConstants.grayFillColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Texts.textBold("Top Coin Analysis",
                    size: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = (constraints.maxWidth - 6) / 2;
              double itemHeight = itemWidth / 1.95;
              double gridHeight = itemHeight * 2 + 70;

              return SizedBox(
                height: gridHeight,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth * 0.015,
                    crossAxisSpacing: screenWidth * 0.015,
                    childAspectRatio: 1.95,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(RoutesName.screenShotScreen),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      flagImages[index],
                                      height: screenWidth * 0.09,
                                      width: screenWidth * 0.09,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Texts.textBold(pairNames[index],
                                      size: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.whiteColor),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: ColorConstants.whiteColor,
                                size: screenWidth * 0.04),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => CustomTopHeader(
                  announcementText:
                      "Your trading journey starts with the right signals. And To Follow trends and maximize your profit.\n",
                  isForex: tabController.isForex.value,
                  forexUI: const SizedBox(),
                  cryptoUI: const SizedBox(),
                  onForexTap: () => tabController.isForex(true),
                  onCryptoTap: () => tabController.isForex(false),
                )),
            Obx(() => tabController.isForex.value
                ? buildForexUI(context)
                : buildCryptoUI(context)),
            SizedBox(height: Get.height * 0.015),
            const PreviousResult(),
            SizedBox(height: Get.height * 0.008),
          ],
        ),
      ),
    );
  }
}
