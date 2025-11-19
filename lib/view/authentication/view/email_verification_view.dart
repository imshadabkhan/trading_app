import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';
import '../../../core/widgets/custom_button.dart';

import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';


import '../controller/authentication_controller.dart';




class EmailVerificationView extends StatelessWidget {
  TextEditingController otpController = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: authenticationController,
        builder: (_) {
          return Scaffold(
            backgroundColor: ColorConstants.whiteColor,
            appBar: AppBar(

              backgroundColor: ColorConstants.whiteColor,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 15,
                  )),
              title: Image.asset(
                Assets.logoWithNoTxt,
                width: .40,
              ),
            ),
            body:SafeArea(
              child: Padding(
                padding: PaddingConstants.screenPaddingHalf,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Widgets.heightSpaceH2,
                    Texts.textBold("Enter OTP to Verify Your Account",
                        color: ColorConstants.blackColor,
                        size: 24,
                        textAlign: TextAlign.start),
                    Widgets.heightSpaceH1,
                    Texts.textNormal(
                      "We’ve sent a One-Time Password (OTP) to your registered email. Please enter it below to complete the verification process.",
                      color: ColorConstants.greyTextColor,
                      size: 11,
                      textAlign: TextAlign.start,
                    ),
                    Widgets.heightSpaceH5,
                    PinCodeTextField(
                      controller: otpController,
                      appContext: context,
                      length: 6,
                      autoDisposeControllers: true,
                      animationType: AnimationType.fade,
                      textStyle: TextStyle(
                          color: Colors.black, fontFamily: "InstrumentSansRegular"),
                      pinTheme: PinTheme(
                          fieldWidth: .12,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: .5,
                          selectedBorderWidth: .8,
                          activeBorderWidth: .5,
                          activeFillColor: ColorConstants.greyTextColor,
                          inactiveFillColor: ColorConstants.greyTextColor,
                          inactiveBorderWidth: .5,
                          selectedColor: ColorConstants.whiteColor,
                          activeColor: Colors.black12.withOpacity(.09),
                          selectedFillColor: ColorConstants.greyTextColor,
                          inactiveColor: Colors.grey.shade300),
                      cursorColor: ColorConstants.blackColor,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    Widgets.heightSpaceH2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Texts.textNormal("Didn’t receive the OTP?  ",
                            color: Colors.black45, size: 12),
                        GestureDetector(
                          onTap: () {
                            authenticationController.resendMailOtp(authenticationController.email.toString());
                          },
                          child: Texts.textBlock("Resend",
                              color: ColorConstants.blackColor,
                              size: 13,
                              fontFamily: "InstrumentSansRegular",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      label: "Verify OTP",
                      textColor: ColorConstants.blackColor,
                      backgroundColor: ColorConstants.primaryColor,
                      radius: 50,
                      onTap: () {
                        otpController.text.length != 6
                            ? Widgets.showSnackBar(
                            "OTP Form", "Please enter 6 digits OTP")
                            :authenticationController.verifyOTP(authenticationController.userID!, otpController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}