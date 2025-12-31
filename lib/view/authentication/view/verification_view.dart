import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trading_app/view/authentication/view/reset_password_view.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  late TextEditingController otpController;
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: ColorConstants.whiteColor,
              size: screenWidth * 0.07,
            ),
            onPressed: () => Get.back(),
          ),
          backgroundColor: ColorConstants.primaryColor,
          centerTitle: true,
          title: Texts.textBold(
            'Verification',
            size: screenWidth * 0.06,
            fontWeight: FontWeight.w600,
            color: ColorConstants.whiteColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03), // Widgets.heightSpaceH2
              Texts.textNormal(
                "A 6 digit code has been sent to your email.Please Enter your verification code below!",
                color: ColorConstants.whiteColor,
                size: screenWidth * 0.037,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04), // Widgets.heightSpaceH3
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Texts.textMedium(
                    "Enter 6 Digit Code",
                    color: ColorConstants.whiteColor,
                    size: screenWidth * 0.037,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015), // Widgets.heightSpaceH1
              PinCodeTextField(
                //mainAxisAlignment: MainAxisAlignment.center,
                controller: otpController,
                appContext: context,
                length: 6,
                autoDisposeControllers: true,
                animationType: AnimationType.fade,
                textStyle: TextStyle(
                  color: ColorConstants.blackColor,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                  fieldHeight: screenWidth * 0.12,
                  fieldWidth: screenWidth * 0.12,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  activeFillColor: ColorConstants.whiteColor,
                  inactiveFillColor: ColorConstants.whiteColor,
                  selectedFillColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  selectedColor: ColorConstants.whiteColor,
                  borderWidth: 0,
                ),
                cursorColor: ColorConstants.blackColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Texts.textMedium(
                      "Didn't received? ",
                      size: screenWidth * 0.033,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.whiteColor,
                    ),
                    Texts.textMedium(
                      "Resend Code",
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.whiteColor,
                      size: screenWidth * 0.033,
                      decoration: TextDecoration.underline,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.015), // Widgets.heightSpaceH1
              Texts.textBlock(
                authenticationController.email ?? "",
                color: Colors.black,
                size: screenWidth * 0.04,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsRegular",
              ),
              SizedBox(height: screenHeight * 0.04), // Widgets.heightSpaceH3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textNormal(
                    "00:${_start.toString().padLeft(2, '0')}",
                    size: screenWidth * 0.037,
                    color: ColorConstants.grayFillColor,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04), // Widgets.heightSpaceH3
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: CustomButton(
                  backgroundColor: ColorConstants.secandoryColor,
                  borderColor: otpController.text.length != 6
                      ? ColorConstants.blackColor
                      : ColorConstants.primaryColor,
                  label: "Verify OTP",
                  fontSize: screenWidth * 0.043,
                  textColor: otpController.text.length != 6
                      ? ColorConstants.whiteColor
                      : ColorConstants.primaryColor,
                  radius: screenWidth * 0.065,
                  onTap: () {
                    if (otpController.text.length != 6) {
                      Widgets.showSnackBar(
                          "OTP Form", "Please enter 6 digits OTP");
                    } else {
                      Get.to(() => ResetPasswordView());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
