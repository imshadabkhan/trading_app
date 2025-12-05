import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class PreviousResult extends StatelessWidget {
  const PreviousResult({super.key});

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.04,
        vertical: h * 0.00,
      ),
      child: Column(
        children: [
          Widgets.heightSpaceH5,

          // ---------- HEADER ROW ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: h * 0.045,
                padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                decoration: BoxDecoration(
                  color: ColorConstants.grayFillColor,
                  borderRadius: BorderRadius.circular(w * 0.045),
                ),
                child: Center(
                  child: Texts.textNormal(
                    "Previous Day Result",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.02),

          Container(
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.circular(w * 0.025),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: h * 0.018),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Texts.textBold(
                            "Pair",
                            size: w * 0.033,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                        child: VerticalDivider(
                          color: ColorConstants.whiteColor,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Texts.textBold(
                            "Tp",
                            size: w * 0.033,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                        child: VerticalDivider(
                          color: ColorConstants.whiteColor,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Texts.textBold(
                            "SL",
                            size: w * 0.033,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                        child: VerticalDivider(
                          color: ColorConstants.whiteColor,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Texts.textBold(
                            "Total Wins",
                            size: w * 0.033,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                    color: ColorConstants.whiteColor, height: 1, thickness: 1),
                Container(
                  padding: EdgeInsets.symmetric(vertical: h * 0.015),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.045,
                              vertical: h * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.secandoryColor,
                              borderRadius: BorderRadius.circular(w * 0.025),
                            ),
                            child: Texts.textBold(
                              "Gold",
                              size: w * 0.030,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.035),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.040,
                              vertical: h * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(w * 0.020),
                            ),
                            child: Texts.textBold(
                              "2",
                              size: w * 0.030,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.035),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.040,
                              vertical: h * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(w * 0.020),
                            ),
                            child: Texts.textBold(
                              "2",
                              size: w * 0.030,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.035),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.040,
                              vertical: h * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(w * 0.020),
                            ),
                            child: Texts.textBold(
                              "2",
                              size: w * 0.030,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
