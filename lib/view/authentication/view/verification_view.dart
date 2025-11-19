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
  final AuthenticationController authenticationController = AuthenticationController();

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.whiteColor,
          centerTitle: true,
          title:Texts.textBold('Verification',size: 22),
        ),
        body: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgets.heightSpaceH2,

              Texts.textNormal(
                "An 6 Digit Code has been sent to your email address. Enter code to verify your email address",
                color: ColorConstants.greyTextColor,
                size: 13,
                textAlign: TextAlign.center,
              ),
              Widgets.heightSpaceH3,

              Texts.textNormal(
                "Enter 6 Digit Code",
                color: ColorConstants.greyTextColor,
                size: 13,
                textAlign: TextAlign.center,
              ),
              Widgets.heightSpaceH1,
              PinCodeTextField(
                controller: otpController,
                appContext: context,
                length: 6,
                autoDisposeControllers: true,
                animationType: AnimationType.fade,
                textStyle: const TextStyle(color: Colors.black),
                pinTheme: PinTheme(
                    fieldWidth: .12,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: .5,
                    selectedBorderWidth: .8,
                    activeBorderWidth: .5,
                    activeFillColor: ColorConstants.redColorOpacity,
                    inactiveFillColor: ColorConstants.grayFillColor,
                    inactiveBorderWidth: .5,

                    selectedColor: ColorConstants.redColor,
                    activeColor: Colors.black12.withOpacity(.09),
                    selectedFillColor: ColorConstants.whiteColor,
                    inactiveColor: Colors.black12.withOpacity(.09)),
                cursorColor:ColorConstants.blackColor,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,

                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed");
                  }
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end
                ,
                children: [
                Texts.textNormal("Didn't received? ",size: 12),
                Texts.textNormal("Resend Code",size: 12,color: ColorConstants.blackColor,decoration: TextDecoration.underline)
              ],),
            
              Texts.textBlock(authenticationController.email ?? "",
                  color: Colors.black,
                  size: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: "PoppinsRegular"),
              Widgets.heightSpaceH5,

              Widgets.heightSpaceH1,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textNormal("00:48 ", size: 14, color: ColorConstants.grayFillColor),
                ],
              ),
              Widgets.heightSpaceH1,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textNormal("Didn’t receive the OTP?", color: ColorConstants.grayFillColor, size: 14),
                  GestureDetector(
                    onTap: () {
                      authenticationController.resendForgotOtp(
                          authenticationController.email ?? "");
                    },
                    child: Texts.textBlock("Resend ",
                        color: ColorConstants.grayFillColor,
                        size: 14,
                        fontFamily: "InstrumentSansRegular",
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                color: ColorConstants.primaryColor,
borderColor:  otpController.text.length != 6
    ? ColorConstants.blackColor
    : ColorConstants.primaryColor,
                label: "Verify OTP",
                textColor: otpController.text.length != 6?ColorConstants.blackColor:ColorConstants.whiteColor,
                backgroundColor: otpController.text.length != 6
                    ? ColorConstants.grayFillColor
                    : ColorConstants.primaryColor,
                     radius: 10,
                onTap: (){
                  if (otpController.text.length != 6){
                    Widgets.showSnackBar("OTP Form", "Please enter 6 digits OTP");
                  } else {
                    // authenticationController.resendForgotOtp(
                    //     authenticationController.email ?? "");
                    Get.to(()=>ResetPasswordView());
                  }
                },
              ),
              Widgets.heightSpaceH1,
            ],
          ),
        ),
      ),
    );
  }
}

