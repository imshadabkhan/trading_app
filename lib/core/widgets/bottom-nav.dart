import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';

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
    final width = Get.width;
    final height = Get.height;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
          vertical: height * 0.01,
        ),
        child: CustomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          iconSize: width * 0.08,
          borderRadius: Radius.circular(width * 0.06),
          backgroundColor: ColorConstants.primaryColor,
          elevation: 10,
          selectedColor: ColorConstants.secandoryColor,
          unSelectedColor: ColorConstants.whiteColor,
          items: [
            buildNavItem(context, Assets.home2, "Home", 0, width, height),
            buildNavItem(context, Assets.signals1, "Signals", 1, width, height),
            buildNavItem(context, Assets.package, "Package", 2, width, height),
            buildNavItem(context, Assets.news, "Result", 3, width, height),
            buildNavItem(context, Assets.wallet, "Tutorial", 4, width, height),
          ],
        ),
      ),
    );
  }

  CustomNavigationBarItem buildNavItem(BuildContext context, String asset,
      String label, int index, double width, double height) {
    final bool isSelected = currentIndex == index;
    return CustomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: height * 0.025,
            color: isSelected
                ? ColorConstants.secandoryColor
                : ColorConstants.whiteColor,
          ),
          SizedBox(height: height * 0.001),
          Texts.textNormal(
            label,
            color: isSelected
                ? ColorConstants.secandoryColor
                : ColorConstants.whiteColor,
            size: width * 0.014,
          ),
        ],
      ),
    );
  }
}
