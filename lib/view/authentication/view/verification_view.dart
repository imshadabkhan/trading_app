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
  AuthenticationController();

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.primaryColor,
        appBar: AppBar(
          leading: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          backgroundColor: ColorConstants.primaryColor,
          centerTitle: true,
          title: Texts.textBold('Verification',
              size: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        body: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Widgets.heightSpaceH2,
              Texts.textNormal(
                "A 6 digit code has been sent to your email.Please Enter your verification code below!",
                color: ColorConstants.whiteColor,
                size: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              Widgets.heightSpaceH3,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Texts.textMedium(
                    "Enter 6 Digit Code",
                    color: ColorConstants.whiteColor,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Widgets.heightSpaceH1,
              PinCodeTextField(
                //mainAxisAlignment: MainAxisAlignment.center,
                controller: otpController,
                appContext: context,
                length: 6,
                autoDisposeControllers: true,
                animationType: AnimationType.fade,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                  fieldHeight: 50,
                  fieldWidth: 50,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  selectedColor: Colors.white,
                  borderWidth: 0,
                ),
                cursorColor: Colors.black,
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
                    Texts.textMedium("Didn't received? ",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    Texts.textMedium("Resend Code",
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        size: 12,
                        decoration: TextDecoration.underline)
                  ],
                ),
              ),
              Widgets.heightSpaceH1,
              Texts.textBlock(authenticationController.email ?? "",
                  color: Colors.black,
                  size: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: "PoppinsRegular"),
              Widgets.heightSpaceH3,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textNormal(
                      "00:${_start.toString().padLeft(2, '0')}",
                      size: 14,
                      color: ColorConstants.grayFillColor),
                ],
              ),
              Widgets.heightSpaceH3,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  backgroundColor: ColorConstants.secandoryColor,
                  borderColor: otpController.text.length != 6
                      ? ColorConstants.blackColor
                      : ColorConstants.primaryColor,
                  label: "Verify OTP",
                  fontSize: 16,
                  textColor: otpController.text.length != 6
                      ? ColorConstants.whiteColor
                      : ColorConstants.primaryColor,
                  radius: 25,
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
