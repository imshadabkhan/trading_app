import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/small-top-header.dart';
import 'package:trading_app/core/widgets/widgets.dart';
import 'package:trading_app/view/authentication/controller/subscription-controller.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubscriptionController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SmallTopHeader(),

            Transform.translate(
              offset: Offset(
                  0,
                  -MediaQuery.of(context).size.height *
                      0.035), // responsive upward shift
              child: Builder(builder: (context) {
                final width = Get.width;
                final height = Get.height;

                return Stack(
                  children: [
                    // Outer Border Container
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.045),
                      child: Container(
                        height: height * 0.09,
                        width: width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.09),
                          border: Border.all(
                            color: ColorConstants.primaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),

                    // Middle Shadow Container
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.0025),
                      child: Center(
                        child: Container(
                          height: height * 0.086,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.08),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    ColorConstants.primaryColor.withOpacity(.3),
                                blurRadius: width * 0.0048,
                                spreadRadius: width * 0.0028,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Inner Shadow & Content Container
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.009),
                      child: Center(
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.075),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstants.grayBorderColor,
                                blurRadius: width * 0.01,
                                spreadRadius: width * 0.007,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.008,
                              horizontal: width * 0.045,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose a plan',
                                  style: TextStyle(
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.03,
                                  ),
                                ),
                                SizedBox(height: height * 0.008),
                                Text(
                                  'Get a free Forex/Crypto Course by Purchasing Premium',
                                  style: TextStyle(
                                    color: ColorConstants.primaryColor
                                        .withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),

            Widgets.heightSpaceH5,

            /// Monthly Plan
            Widgets.buildPlanCard(
              controller: controller,
              index: 0,
              title: "Monthly",
              price: "\$10",
              period: "/month",
            ),

            Widgets.heightSpaceH5,

            /// Annual Plan
            Widgets.buildPlanCard(
              controller: controller,
              index: 1,
              title: "Annually",
              price: "\$100",
              period: "/year",
              showSaveBadge: true,
            ),

            Widgets.heightSpaceH4,

            Text(
              "OR",
              style: TextStyle(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            Widgets.heightSpaceH4,

            /// Free Premium Account Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstants.secandoryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstants.blackColor.withOpacity(.2),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: const Center(
                    child: Text(
                      "Get a Free Premium Account by Creating a partner Account",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),

            Widgets.heightSpaceH5,

            /// Broker Row 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Widgets.buildBrokerButton(
                    controller: controller,
                    index: 0,
                    text: "Binance",
                  ),
                  const SizedBox(width: 15),
                  Widgets.buildBrokerButton(
                    controller: controller,
                    index: 1,
                    text: "BitGet",
                  ),
                ],
              ),
            ),

            /// Broker Row 2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Widgets.buildBrokerButton(
                    controller: controller,
                    index: 2,
                    text: "Excess",
                  ),
                  const SizedBox(width: 15),
                  Widgets.buildBrokerButton(
                    controller: controller,
                    index: 3,
                    text: "MEXC",
                  ),
                ],
              ),
            ),

            Widgets.heightSpaceH3,
          ],
        ),
      ),
    );
  }
}
