import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/bottom-nav.dart';
import 'package:trading_app/core/widgets/top-header.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/widgets/widgets.dart';
import 'package:trading_app/view/authentication/controller/tab-controller.dart';
import 'package:trading_app/view/home-screens/previous-result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MarketTabController tabController = Get.put(MarketTabController());
  int bottomNavIndex = 0;

  // ---------------- FOREX UI ----------------
  Widget buildForexUI() {
    final flagImages = [
      "assets/images/download (5).png",
      "assets/images/download (6).png",
      "assets/images/Ellipse 110 (1).png",
      "assets/images/Euro Png.... 1.png",
    ];

    final pairNames = ["GBP/USD", "USA/USD", "JPY/USD", "EUR/USD"];

    return Column(
      children: [
        Widgets.heightSpaceH4,
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: const Color(0xFFE3EAF2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              "Top Pair Analysis",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Widgets.heightSpaceH4,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = (constraints.maxWidth - 6) / 2; // 2 columns, spacing
              double itemHeight = itemWidth / 1.95; // childAspectRatio = 1.95
              double gridHeight = itemHeight * 2 + 6; // 2 rows + spacing

              return SizedBox(
                height: gridHeight,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1.95,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff4E1A6F),
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
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                               // Widgets.heightSpaceH2,
                                Text(
                                  pairNames[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 14),
                        ],
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


  Widget buildCryptoUI() {
    final flagImages = [
      "assets/images/download (7).png",
      "assets/images/ethereum.png",
      "assets/images/download (7).png",
      "assets/images/download (7).png",
    ];

    final pairNames = ["BTC", "ETHEREUM", "BNB", "XRP"];

    return Column(
      children: [
        Widgets.heightSpaceH4,
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: const Color(0xFFE3EAF2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              "Top Coin Analysis",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Widgets.heightSpaceH3,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = (constraints.maxWidth - 6) / 2; // 2 columns, spacing
              double itemHeight = itemWidth / 1.95; // childAspectRatio = 1.95
              double gridHeight = itemHeight * 2 + 6; // 2 rows + spacing

              return SizedBox(
                height: gridHeight,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1.95,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff4E1A6F),
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
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //Widgets.heightSpaceH2,
                                Text(
                                  pairNames[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 16),
                        ],
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                      ? buildForexUI()
                      : buildCryptoUI()),

                  Widgets.heightSpaceH3,

                  const PreviousResult(),

                  Widgets.heightSpaceH1,
                ],
              ),
            ),
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
