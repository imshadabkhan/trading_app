import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/drawer.dart';
import 'package:trading_app/core/widgets/small-top-header.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';
import 'package:trading_app/view/home-screens/bottom-nav-controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive dimensions
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          MainNav.controller.hideBottomNav();
        } else {
          MainNav.controller.showBottomNavBar();
        }
      },
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.35),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.primaryColor,
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            controller: tabController,
            isScrollable: false,
            indicatorColor: ColorConstants.secandoryColor,
            indicatorWeight: 5,
            labelColor: ColorConstants.whiteColor,
            unselectedLabelColor: ColorConstants.whiteColor,
            dividerColor: ColorConstants.primaryColor,
            padding: EdgeInsets.only(left: 0),
            tabs: [
              Tab(child: SignalTabbar(text: "Today")),
              Tab(child: SignalTabbar(text: "Last Week")),
              Tab(child: SignalTabbar(text: "Last 3 Months")),
              Tab(child: SignalTabbar(text: "Total Wins")),
            ],
          ),
          flexibleSpace: Column(
            children: [
              SmallTopHeader(
                icon: Icon(
                  Icons.menu,
                  color: ColorConstants.whiteColor,
                  size: screenWidth * 0.07,
                ),
                iconOnTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                labelHeight: 120,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: ColorConstants.secandoryColor.withOpacity(.8),
                          width: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.002),
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.087,
                          width: screenWidth * 0.79,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  ColorConstants.secandoryColor.withOpacity(.8),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstants.secandoryColor,
                                blurRadius: 2,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.008),
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.073,
                          width: screenWidth * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstants.primaryColor,
                                blurRadius: 4,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Center(
                            child: Texts.textBold(
                              "Signal History",
                              color: ColorConstants.whiteColor,
                              size: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildSignalTable("Today", screenHeight),
          buildSignalTable("Last Week", screenHeight),
          buildSignalTable("Last 3 Months", screenHeight),
          buildSignalTable("Total Wins", screenHeight),
        ],
      ),
    );
  }

  Widget buildSignalTable(String title, double screenHeight) {
    final signals = [
      {"name": "BTC", "category": "Crypto", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "ETH", "category": "Crypto", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "ETH", "category": "Crypto", "tp": "4", "sl": "5", "wins": "14"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "BTC", "category": "Crypto", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "ETH", "category": "Crypto", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "ETH", "category": "Crypto", "tp": "4", "sl": "5", "wins": "14"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "BTC", "category": "Crypto", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "10"},
      {"name": "ETH", "category": "Crypto", "tp": "4", "sl": "5", "wins": "12"},
      {"name": "BNB", "category": "Forex", "tp": "4", "sl": "5", "wins": "12"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Texts.textNormal(
                  "Name",
                  color: ColorConstants.whiteColor,
                  size: screenHeight * 0.018,
                ),
                Widgets.verticalLine(),
                Texts.textNormal(
                  "Category",
                  color: ColorConstants.whiteColor,
                  size: screenHeight * 0.018,
                ),
                Widgets.verticalLine(),
                Texts.textNormal(
                  "TP",
                  color: ColorConstants.whiteColor,
                  size: screenHeight * 0.018,
                ),
                Widgets.verticalLine(),
                Texts.textNormal(
                  "SL",
                  color: ColorConstants.whiteColor,
                  size: screenHeight * 0.018,
                ),
                Widgets.verticalLine(),
                Texts.textNormal(
                  "Wins",
                  color: ColorConstants.whiteColor,
                  size: screenHeight * 0.018,
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              radius: const Radius.circular(50),
              thumbVisibility: true,
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.only(top: 0),
                itemCount: signals.length,
                itemBuilder: (context, index) {
                  final signal = signals[index];
                  final bool isBorderGroup = (index % 4) < 2;
                  return Widgets.buildRow(
                    isBorderGroup,
                    signal["name"]!,
                    signal["category"]!,
                    signal["tp"]!,
                    signal["sl"]!,
                    signal["wins"]!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
