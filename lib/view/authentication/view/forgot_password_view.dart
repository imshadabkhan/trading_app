import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/view/authentication/view/verification_view.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/entry_field.dart';
import '../../../core/widgets/text_widgets.dart';
import '../controller/authentication_controller.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends StatelessWidget {
  // AuthenticationController authenticationController = Get.find();
  TextEditingController emailController = TextEditingController();

  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.chevron_left,
                color: ColorConstants.whiteColor,
                size: screenWidth * 0.09,
              )),
          title: Texts.textBold(
            "Forget Password",
            size: screenWidth * 0.055,
            color: ColorConstants.whiteColor,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: ColorConstants.primaryColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Center(
                  child: Texts.textMedium(
                    "You’ll receive 6 digit code \n          on your email ",
                    color: ColorConstants.whiteColor,
                    size: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              EntryField(
                label: "Email Address",
                labelColor: ColorConstants.whiteColor,
                prefixIconWidget: Icon(
                  Icons.person_outline,
                  color: ColorConstants.iconColors,
                  size: screenWidth * 0.045,
                ),
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hint: "MK ALI Trader",
              ),
              SizedBox(height: screenHeight * 0.025),
              CustomButton(
                label: "Verify",
                textColor: ColorConstants.primaryColor,
                fontSize: screenWidth * 0.035,
                backgroundColor: ColorConstants.secandoryColor,
                radius: screenWidth * 0.065,
                onTap: () {
                  Get.to(() => VerificationView());
                  // if (!GetUtils.isEmail(emailController.text)) {
                  //   Widgets.showSnackBar(
                  //       "Incomplete Form", "Please enter valid email");
                  // }else{
                  //
                  //   authenticationController.requestForgotPassword(emailController.text);
                  // }
                  // Get.to(() => VerificationView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
