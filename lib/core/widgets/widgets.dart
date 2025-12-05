import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/view/authentication/controller/subscription-controller.dart';
import '../constants/color_constants.dart';
import '../widgets/text_widgets.dart';

class Widgets {
  static var heightSpaceH05 = const SizedBox(
    height: 2,
  );
  static var heightSpaceH1 = const SizedBox(
    height: 5,
  );
  static var heightSpaceH2 = const SizedBox(
    height: 10,
  );
  static var heightSpaceH3 = const SizedBox(
    height: 15,
  );
  static var heightSpaceH4 = const SizedBox(
    height: 20,
  );
  static var heightSpaceH5 = const SizedBox(
    height: 25,
  );
  static var heightSpaceH50 = const SizedBox(
    height: 50,
  );
  static var widthSpaceW05 = const SizedBox(
    width: 2,
  );
  static var widthSpaceW1 = const SizedBox(
    width: 7,
  );
  static var widthSpaceW2 = const SizedBox(
    width: 10,
  );
  static var widthSpaceW3 = const SizedBox(
    width: 15,
  );
  static var widthSpaceW4 = const SizedBox(
    width: 20,
  );

  static void showSnackBar(String title, String message) {
    Get.snackbar(
      icon: Icon(
        title != "Success" ? Icons.info_outline : Icons.check_circle_outline,
        color: Colors.white,
      ),
      title,
      borderColor: Colors.white,
      borderWidth: 5,
      message,
      backgroundColor: title != "Success" ? Colors.red : Colors.green,
      colorText: Colors.white,
    );
  }

  static Widget assetImage(String url, double width, double height) {
    return Image.asset(url, fit: BoxFit.cover, width: width, height: height);
  }

  static Widget divider({bool isVertical = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: isVertical
          ? const VerticalDivider(thickness: 1.0, color: Colors.black12)
          : Divider(height: 1.0, thickness: 0.5, color: Colors.grey.shade500),
    );
  }

  // static void showLoader(String message) {
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..backgroundColor = ColorConstants.primaryColor
  //     ..indicatorColor = Colors.white
  //     ..textColor = Colors.white
  //     ..maskColor = ColorConstants.primaryColor
  //     ..dismissOnTap = false;
  //
  //   EasyLoading.show(
  //     maskType: EasyLoadingMaskType.none,
  //     indicator: const CircularProgressIndicator(color: Colors.white),
  //     status: message,
  //   );
  // }

  static Future<bool> confirmationDialogue(
      BuildContext context, String title, String content) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Get.back(result: false),
                  child: Text('No',
                      style: TextStyle(color: ColorConstants.primaryColor)),
                ),
                TextButton(
                  onPressed: () => Get.back(result: true),
                  child: Text('Yes',
                      style: TextStyle(color: ColorConstants.primaryColor)),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static void openMoreOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- HANDLE BAR ---
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              optionTile(
                text: "Follow",
                onTap: () {
                  Navigator.pop(context);
                  print("Follow clicked");
                },
              ),

              optionTile(
                text: "View Profile",
                onTap: () {
                  Navigator.pop(context);
                  print("View Profile clicked");
                },
              ),

              optionTile(
                text: "Message",
                onTap: () {
                  Navigator.pop(context);
                  print("Message clicked");
                },
              ),
              Widgets.heightSpaceH3,
            ],
          ),
        );
      },
    );
  }

  static Widget optionTile({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Texts.textMedium(text, size: 14),
          ],
        ),
      ),
    );
  }

  ///MessageBubble
  static Widget buildMessageBubble(
      {required Widget content,
      required Widget datecontent,
      required int likes,
      required int views,
      required String time}) {
    return Builder(builder: (context) {
      final w = MediaQuery.of(context).size.width;
      final h = MediaQuery.of(context).size.height;

      return Padding(
        padding:
            EdgeInsets.only(left: w * 0.03, top: h * 0.012, right: w * 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: content is ClipRRect || content is Image
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(
                      horizontal: w * 0.035, vertical: h * 0.012),
              decoration: BoxDecoration(
                color: ColorConstants.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w * 0.05),
                  bottomLeft: Radius.circular(w * 0.05),
                  bottomRight: Radius.circular(w * 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.blackColor.withOpacity(0.05),
                    blurRadius: w * 0.012,
                    offset: Offset(0, h * 0.003),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [content, datecontent],
              ),
            ),
            MessageMetadata(likes: likes, views: views, time: time),
          ],
        ),
      );
    });
  }

  /// =============== PLAN CARD ===============
  static Widget buildPlanCard({
    required SubscriptionController controller,
    required int index,
    required String title,
    required String price,
    required String period,
    bool showSaveBadge = false,
  }) {
    return Builder(
      builder: (context) {
        final w = MediaQuery.of(context).size.width;
        final h = MediaQuery.of(context).size.height;

        return Obx(() {
          final isSelected = controller.selectedPlanIndex.value == index;

          return GestureDetector(
            onTap: () {
              controller.selectedPlanIndex.value = index;
              Future.delayed(
                Duration(seconds: 0),
                () async {
                  return await Get.bottomSheet(
                    PremiumPaymentBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Container(
                padding: EdgeInsets.all(w * 0.05),
                decoration: BoxDecoration(
                  color: ColorConstants.grayBorderColor,
                  borderRadius: BorderRadius.circular(w * 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? ColorConstants.blackColor.withOpacity(.7)
                          : ColorConstants.blackColor.withOpacity(.5),
                      blurRadius: w * 0.012,
                      offset: Offset(0, h * 0.004),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.04,
                              ),
                            ),
                            if (showSaveBadge)
                              Container(
                                margin: EdgeInsets.only(left: w * 0.025),
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.02, vertical: h * 0.005),
                                decoration: BoxDecoration(
                                  color: ColorConstants.secandoryColor,
                                  borderRadius: BorderRadius.circular(w * 0.03),
                                ),
                                child: Text(
                                  "Save 10%",
                                  style: TextStyle(
                                      fontSize: w * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                          ],
                        ),
                        Widgets.heightSpaceH2,
                        RichText(
                          text: TextSpan(
                            style:
                                TextStyle(color: ColorConstants.primaryColor),
                            children: [
                              TextSpan(
                                text: price,
                                style: TextStyle(
                                    fontSize: w * 0.06,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " $period",
                                style: TextStyle(fontSize: w * 0.04),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: ColorConstants.primaryColor,
                      size: w * 0.07,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  /// =============== BROKER BUTTON ===============
  static Widget buildBrokerButton({
    required SubscriptionController controller,
    required int index,
    required String text,
  }) {
    return Builder(builder: (context) {
      final w = MediaQuery.of(context).size.width;
      final h = MediaQuery.of(context).size.height;

      return Obx(() {
        final isSelected = controller.selectedBrokerIndex.value == index;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              controller.selectedBrokerIndex.value = index;
              Future.delayed(
                Duration(seconds: 0),
                () async {
                  return await Get.bottomSheet(
                    BrokerBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                },
              );
            },
            child: Container(
              height: h * 0.075,
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorConstants.primaryColor
                    : ColorConstants.grayFillColor,
                borderRadius: BorderRadius.circular(w * 0.04),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: w * 0.01,
                    offset: Offset(0, h * 0.003),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isSelected
                          ? ColorConstants.whiteColor
                          : ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.04,
                    ),
                  ),
                  Widgets.heightSpaceH2,
                  Icon(
                    Icons.chevron_right,
                    color: isSelected
                        ? ColorConstants.whiteColor
                        : ColorConstants.primaryColor,
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  static Widget buildRow(
      bool isEven, String name, String cat, String tp, String sl, String wins) {
    return Builder(builder: (context) {
      final w = MediaQuery.of(context).size.width;
      final h = MediaQuery.of(context).size.height;

      return Container(
        padding: EdgeInsets.symmetric(vertical: h * 0.018),
        decoration: BoxDecoration(
          color: isEven
              ? ColorConstants.grayBorderColor
              : ColorConstants.grayFillColor,
          border: Border(
            bottom: BorderSide(
              color: ColorConstants.grayBorderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  Assets.ethereum,
                  height: h * 0.045,
                  width: h * 0.045,
                  fit: BoxFit.cover,
                ),
                Texts.textBold(name,
                    fontWeight: FontWeight.bold, size: w * 0.033),
              ],
            ),
            Text(cat, style: TextStyle(fontSize: w * 0.033)),
            Text(tp, style: TextStyle(fontSize: w * 0.033)),
            Text(sl, style: TextStyle(fontSize: w * 0.033)),
            Text(wins, style: TextStyle(fontSize: w * 0.033)),
          ],
        ),
      );
    });
  }

  static Widget verticalLine() {
    return Builder(builder: (context) {
      final h = MediaQuery.of(context).size.height;
      final w = MediaQuery.of(context).size.width;

      return Container(
        height: h * 0.06,
        width: w * 0.003,
        color: ColorConstants.whiteColor.withOpacity(0.5),
        margin: EdgeInsets.symmetric(horizontal: w * 0.02),
      );
    });
  }
}

//premium payment bottom
class PremiumPaymentBottomSheet extends StatelessWidget {
  final TextEditingController payIDController = TextEditingController();

  PremiumPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.9;
    final width = size.width;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorConstants.bottomSheetBack,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          // Drag Handle Bar
          Container(
            margin: EdgeInsets.only(bottom: height * 0.03),
            height: height * 0.007,
            width: width * 0.18,
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.05),
                  bottomRight: Radius.circular(width * 0.05)),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(height, width),
                  SizedBox(height: height * 0.02),
                  title("Pay ID", width),
                  inputField("binance/1234", width),
                  SizedBox(height: height * 0.02),
                  title("Trc20 Address", width),
                  inputField("trc20/1234", width),
                  SizedBox(height: height * 0.02),
                  title("Bep20 Address", width),
                  inputField("bep/1234", width),
                  SizedBox(height: height * 0.02),
                  alsoPaySection(width),
                  SizedBox(height: height * 0.015),
                  paymentOptions(context, width),
                  SizedBox(height: height * 0.015),
                  instructionsSection(width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header(double height, double width) {
    return Container(
      height: height * 0.06,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(width * 0.035),
      ),
      child: Center(
        child: Text(
          'Premium Subscription Payment Method',
          style: TextStyle(
            fontSize: width * 0.03,
            fontWeight: FontWeight.w700,
            color: ColorConstants.secandoryColor,
          ),
        ),
      ),
    );
  }

  Widget title(String text, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
      child: Text(
        text,
        style: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: width * 0.045,
        ),
      ),
    );
  }

  Widget inputField(String hintText, double width) {
    return Container(
      margin: EdgeInsets.only(top: width * 0.02),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(width * 0.035),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.primaryColor.withOpacity(.25),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyle(color: ColorConstants.blackColor.withOpacity(.3)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(width * 0.04),
          suffixIcon: Icon(
            Icons.copy,
            color: ColorConstants.secandoryColor.withOpacity(.5),
            size: width * 0.035,
          ),
        ),
      ),
    );
  }

  Widget alsoPaySection(double width) {
    return Center(
      child: Text(
        'Also Pay through Easy Paisa or Bank',
        style: TextStyle(
          color: ColorConstants.primaryColor,
          fontSize: width * 0.05,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget paymentOptions(BuildContext context, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        paymentBox(context, 'Easy Paisa', Assets.easypaisa, width),
        paymentBox(context, 'Bank', Assets.bankImg, width),
      ],
    );
  }

  Widget paymentBox(
      BuildContext context, String title, String image, double width) {
    return Container(
      width: width * 0.43,
      height: width * 0.22,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(width * 0.05),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.blackColor.withOpacity(.25),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: width * 0.1),
          SizedBox(height: width * 0.015),
          Text(
            title,
            style: TextStyle(
              color: ColorConstants.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.05,
            ),
          )
        ],
      ),
    );
  }

  Widget instructionsSection(double width) {
    const List<String> items = [
      'Automatically added to the lifetime premium plan.',
      'Copy Pay id link for further process.',
      'Provide Screenshot of payment.',
      'automatically added to the lifetime premium plan.',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.025),
          child: Text(
            "INSTRUCTIONS",
            style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: width * 0.055,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: width * 0.015),
        Container(
          padding: EdgeInsets.all(width * 0.04),
          decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((text) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\u2022 ',
                      style: TextStyle(
                        fontSize: width * 0.065,
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: width * 0.038,
                          color: ColorConstants.primaryColor,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

// broker bottom
class BrokerBottomSheet extends StatelessWidget {
  final TextEditingController payIDController = TextEditingController();

  BrokerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.7;
    final width = size.width;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorConstants.bottomSheetBack,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          // Drag Handle Bar
          Container(
            margin: EdgeInsets.only(bottom: height * 0.03),
            height: height * 0.007,
            width: width * 0.18,
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.05),
                  bottomRight: Radius.circular(width * 0.05)),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(width, height),
                  SizedBox(height: height * 0.025),
                  instructionsSection(width),
                  SizedBox(height: height * 0.02),
                  title("Partner Code", width),
                  inputField("1234", width),
                  SizedBox(height: height * 0.02),
                  CustomButton(
                    backgroundColor: ColorConstants.secandoryColor,
                    label: 'Partner Link',
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: width * 0.045),
                    textColor: ColorConstants.primaryColor,
                    radius: width * 0.035,
                    shadow: [
                      BoxShadow(
                        color: ColorConstants.primaryColor.withOpacity(.25),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header(double width, double height) {
    return Container(
      height: height * 0.06,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(width * 0.035),
      ),
      child: Center(
        child: Text(
          'Account Link Process For Premium',
          style: TextStyle(
            fontSize: width * 0.03,
            fontWeight: FontWeight.w700,
            color: ColorConstants.secandoryColor,
          ),
        ),
      ),
    );
  }

  Widget title(String text, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
      child: Text(
        text,
        style: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: width * 0.045,
        ),
      ),
    );
  }

  Widget inputField(String hintText, double width) {
    return Container(
      margin: EdgeInsets.only(top: width * 0.02),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(width * 0.035),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.primaryColor.withOpacity(.25),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyle(color: ColorConstants.blackColor.withOpacity(.3)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(width * 0.04),
          suffixIcon: Icon(
            Icons.copy,
            color: ColorConstants.secandoryColor.withOpacity(.5),
            size: width * 0.035,
          ),
        ),
      ),
    );
  }

  Widget instructionsSection(double width) {
    const List<String> items = [
      'Automatically added to the lifetime premium plan.',
      'Copy Pay id link for further process.',
      'Provide Screenshot of payment.',
      'automatically added to the lifetime premium plan.',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.025),
          child: Text(
            "INSTRUCTIONS",
            style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: width * 0.055,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: width * 0.015),
        Container(
          padding: EdgeInsets.all(width * 0.04),
          decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.circular(width * 0.05),
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.blackColor.withOpacity(.25),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((text) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\u2022 ',
                      style: TextStyle(
                        fontSize: width * 0.065,
                        color: ColorConstants.bottomSheetBack.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.038,
                          color: ColorConstants.bottomSheetBack.withOpacity(.7),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

//MessageMeta
class MessageMetadata extends StatelessWidget {
  final int likes;
  final int views;
  final String time;

  const MessageMetadata({
    super.key,
    required this.likes,
    required this.views,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    Color purpleColor = ColorConstants.primaryColor;
    TextStyle textStyle = TextStyle(
      fontSize: w * 0.03,
      color: purpleColor,
    );

    return Padding(
      padding: EdgeInsets.only(top: h * 0.005, bottom: h * 0.01),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Likes (Heart Icon)
          Icon(
            Icons.favorite,
            color: ColorConstants.secandoryColor,
            size: w * 0.04,
          ),
          SizedBox(width: w * 0.01),
          Text(likes.toString(), style: textStyle),
          SizedBox(width: w * 0.03),

          // Views (Eye Icon)
          Icon(
            Icons.visibility,
            color: purpleColor,
            size: w * 0.04,
          ),
          SizedBox(width: w * 0.01),
          Text(views.toString(), style: textStyle),
          SizedBox(width: w * 0.03),

          // Timestamp
          Text(time, style: textStyle),
        ],
      ),
    );
  }
}

class SignalTabbar extends StatelessWidget {
  final String text;
  const SignalTabbar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: 0),
      child: Container(
        height: h * 0.055,
        width: w * 0.25,
        decoration: BoxDecoration(
          color: ColorConstants.whiteColor,
          borderRadius: BorderRadius.circular(w * 0.025),
        ),
        child: Center(
          child: Texts.textBold(
            text,
            size: w * 0.025,
            color: ColorConstants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TutorialCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const TutorialCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.primaryColor.withOpacity(.1),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: screenHeight * 0.12,
              width: screenWidth * 0.28,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                    color: ColorConstants.tutorialSubtitle.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.youtube,
                      height: screenHeight * 0.035,
                      width: screenHeight * 0.035,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "YOU TUBE",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
