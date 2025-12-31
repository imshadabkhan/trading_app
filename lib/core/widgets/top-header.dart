import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';

class CustomTopHeader extends StatelessWidget {
  final String announcementText;
  final bool isForex;
  final Widget forexUI;
  final Widget cryptoUI;
  final VoidCallback onForexTap;
  final VoidCallback onCryptoTap;

  const CustomTopHeader({
    super.key,
    required this.announcementText,
    required this.isForex,
    required this.forexUI,
    required this.cryptoUI,
    required this.onForexTap,
    required this.onCryptoTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    return SizedBox(
      height: height * 0.35, // responsive height
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main purple header box
          Container(
            width: double.infinity,
            height: height * 0.33, // responsive
            padding: EdgeInsets.only(
              top: height * 0.06,
              left: width * 0.05,
              right: width * 0.05,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Icon(
                          Icons.menu,
                          color: ColorConstants.whiteColor,
                          size: width * 0.07,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications,
                            color: ColorConstants.whiteColor,
                            size: width * 0.07),
                        SizedBox(width: width * 0.025),
                        Container(
                          padding: EdgeInsets.all(width * 0.005),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorConstants.whiteColor.withOpacity(.7),
                              width: width * 0.005,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: width * 0.045,
                            backgroundImage: AssetImage(Assets.images5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.015),

                // Announcement
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.045),
                  child: Material(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.circular(width * 0.03),
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: height * 0.015),
                      child: Column(
                        children: [
                          Texts.textBold("Announcement",
                              size: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryColor),
                          SizedBox(height: height * 0.01),
                          Texts.textBold(announcementText,
                              textAlign: TextAlign.center,
                              size: width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.blackColor.withOpacity(.7)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Forex / Crypto Button Tabs ---
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Forex Button
                GestureDetector(
                  onTap: onForexTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.015),
                    decoration: BoxDecoration(
                        color: isForex
                            ? ColorConstants.secandoryColor
                            : ColorConstants.whiteColor,
                        borderRadius: BorderRadius.circular(width * 0.04),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.blackColor.withOpacity(.5),
                              blurRadius: 4,
                              offset: Offset(0, 1))
                        ]),
                    child: Texts.textBold(
                      "Forex",
                      size: width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: isForex
                          ? ColorConstants.whiteColor
                          : ColorConstants.primaryColor,
                    ),
                  ),
                ),

                SizedBox(width: width * 0.025),

                // Crypto Button
                GestureDetector(
                  onTap: onCryptoTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.015),
                    decoration: BoxDecoration(
                        color: isForex
                            ? ColorConstants.whiteColor
                            : ColorConstants.secandoryColor,
                        borderRadius: BorderRadius.circular(width * 0.04),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.blackColor.withOpacity(.5),
                              blurRadius: 4,
                              offset: Offset(0, 1))
                        ]),
                    child: Texts.textBold(
                      "Crypto",
                      size: width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: isForex
                          ? ColorConstants.primaryColor
                          : ColorConstants.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: width * 0.045,
            right: width * 0.045,
            top: height * 0.37,
            child: isForex ? forexUI : cryptoUI,
          ),
        ],
      ),
    );
  }
}
