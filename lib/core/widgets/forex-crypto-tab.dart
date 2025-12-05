import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';

// Color constants (replace with your own if needed)
class ColorConstantsTwo {
  static const Color blue = Colors.blue;
  static const Color blueAccent = Colors.blueAccent;
}

// Controller for tab selection
class TabControllerX extends GetxController {
  RxInt selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}

// ForexCryptoTab Widget
class ForexCryptoTab extends StatefulWidget {
  final Color blue;
  final Color bluAccent;
  final Widget forexContent;
  final Widget cryptoContent;

  const ForexCryptoTab({
    super.key,
    required this.blue,
    required this.bluAccent,
    required this.forexContent,
    required this.cryptoContent,
  });

  @override
  State<ForexCryptoTab> createState() => _ForexCryptoTabState();
}

class _ForexCryptoTabState extends State<ForexCryptoTab> {
  late final TabControllerX controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(TabControllerX());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return SizedBox(
      height: screenHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Content
          Padding(
            padding: EdgeInsets.only(top: topPadding + 50),
            child: Obx(() => controller.selectedTab.value == 0
                ? widget.forexContent
                : widget.cryptoContent),
          ),
          // Segmented Buttons
          Positioned(
            top: -10, // adjust as needed
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.changeTab(0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 0
                            ? widget.bluAccent
                            : ColorConstants.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color:
                                ColorConstants.grayFillColor.withOpacity(.6)),
                      ),
                      child: Center(
                        child: Text(
                          "Forex",
                          style: TextStyle(
                            color: controller.selectedTab.value == 0
                                ? ColorConstants.whiteColor
                                : widget.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.changeTab(1),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 1
                            ? widget.bluAccent
                            : ColorConstants.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color:
                                ColorConstants.grayFillColor.withOpacity(.6)),
                      ),
                      child: Center(
                        child: Text(
                          "Crypto",
                          style: TextStyle(
                            color: controller.selectedTab.value == 1
                                ? ColorConstants.whiteColor
                                : widget.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example HomeScreen to use ForexCryptoTab
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forex & Crypto"),
        backgroundColor: ColorConstantsTwo.blue,
        elevation: 0,
      ),
      body: ForexCryptoTab(
        blue: ColorConstantsTwo.blue,
        bluAccent: ColorConstantsTwo.blueAccent,
        forexContent: Container(
          color: ColorConstants.grayFillColor.withOpacity(.2),
          child: const Center(child: Text("Forex Content Here")),
        ),
        cryptoContent: Container(
          color: ColorConstantsTwo.blue.withOpacity(.2),
          child: const Center(child: Text("Crypto Content Here")),
        ),
      ),
    );
  }
}

// Main entry
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
