import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  final List<Map<String, String>> info = const [
    {
      "title": "General Terms",
      "subtitle":
          "Welcome to our trading app. By accessing or using the app, you agree to abide by these terms and conditions. You are responsible for maintaining the confidentiality of your account credentials, and you must ensure that no unauthorized person gains access to your account. Trading involves substantial risks, and it may not be suitable for all users. You should carefully assess your investment objectives, financial situation, and risk tolerance before engaging in any trading activity. Misuse of the app, fraudulent activities, or violation of applicable laws is strictly prohibited. We reserve the right to suspend or terminate accounts involved in such activities without prior notice."
    },
    {
      "title": "Updates and Liability",
      "subtitle":
          "We reserve the right to modify or update these terms and conditions at any time. Continued use of the app after any changes constitutes your acceptance of the updated terms. While we strive to provide accurate and timely information, the app and its content are provided 'as is,' and we do not guarantee any specific results from using our trading services. Users are solely responsible for their trading decisions and any associated risks. The app, its creators, and affiliates are not liable for any losses, damages, or claims arising from the use of the app or reliance on its content. By using the app, you acknowledge and accept these terms in full."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = Get.width;

    return Scaffold(
      appBar: AppBar(
        title: Texts.textBold(
          "Terms & Conditions",
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

            // Terms Info
            ...info.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textMedium(item["title"]!,
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                        size: w * 0.045,
                        maxLines: 20),
                    Texts.textMedium(
                      item["subtitle"]!,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
                      size: w * 0.035,
                      maxLines: 20,
                    ),
                    Widgets.heightSpaceH5,
                  ],
                ),
              ),
            ),

            Widgets.heightSpaceH50,
          ],
        ),
      ),
    );
  }
}
