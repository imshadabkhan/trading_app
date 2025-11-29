import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Color constants (replace with your own if needed)
class ColorConstants {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.blueAccent;
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
  final Color primaryColor;
  final Color secondaryColor;
  final Widget forexContent;
  final Widget cryptoContent;

  const ForexCryptoTab({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
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
                            ? widget.secondaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          "Forex",
                          style: TextStyle(
                            color: controller.selectedTab.value == 0
                                ? Colors.white
                                : widget.primaryColor,
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
                            ? widget.secondaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          "Crypto",
                          style: TextStyle(
                            color: controller.selectedTab.value == 1
                                ? Colors.white
                                : widget.primaryColor,
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
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
      ),
      body: ForexCryptoTab(
        primaryColor: ColorConstants.primaryColor,
        secondaryColor: ColorConstants.secondaryColor,
        forexContent: Container(
          color: Colors.green.shade100,
          child: const Center(child: Text("Forex Content Here")),
        ),
        cryptoContent: Container(
          color: Colors.purple.shade100,
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
