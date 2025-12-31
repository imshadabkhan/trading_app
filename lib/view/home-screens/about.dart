import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  final List<Map<String, String>> info = const [
    {
      "title": "Our Mission",
      "subtitle":
          "Our mission is to provide users with accurate and timely trading signals to help them make informed decisions in the financial markets."
    },
    {
      "title": "How to reset my password?",
      "subtitle":
          "To reset your password, go to the login screen and click on the 'Forgot Password' link."
    },
    {
      "title": "Our Vision",
      "subtitle":
          "Our vision is to be the leading provider of trading signals and educational resources in the industry."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = Get.width;

    return Scaffold(
      appBar: AppBar(
        title: Texts.textBold(
          "About Us",
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
          size: w * 0.05,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Widgets.heightSpaceH4,
            // About Info
            ...info.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium(
                      item["title"]!,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600,
                      size: w * 0.045,
                    ),
                    Texts.textMedium(
                      item["subtitle"]!,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
                      size: w * 0.035,
                    ),
                    Widgets.heightSpaceH5,
                  ],
                ),
              ),
            ),
            Widgets.heightSpaceH50,

            // Version
            Texts.textMedium(
              "Version 1.0.0",
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.w500,
              size: w * 0.04,
            ),
            Widgets.heightSpaceH50,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: w * .3,
                  label: "Website",
                  shadow: [],
                  backgroundColor: ColorConstants.primaryColor,
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Container(
                      width: w * 0.08,
                      height: w * 0.08,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(Assets.f),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: w * 0.08,
                      height: w * 0.08,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(Assets.t),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: w * 0.08,
                      height: w * 0.08,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(Assets.l),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
