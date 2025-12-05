import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/padding_constants.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/view/authentication/view/verification_view.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/entry_field.dart';
import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';

class SignUpView extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive screen dimensions
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.075,
            vertical: screenHeight * 0.2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Widgets.heightSpaceH5,

              /// ✅ Sign Up title ABOVE the fields
              Texts.textMedium(
                "Sign Up",
                size: screenWidth * 0.07,
                color: ColorConstants.whiteColor,
                fontWeight: FontWeight.w600,
              ),

              SizedBox(height: screenHeight * 0.02), // Widgets.heightSpaceH3

              formSection(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.02), // Widgets.heightSpaceH3

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textBold(
                    "Already have an account?  ",
                    color: ColorConstants.whiteColor,
                    size: screenWidth * 0.035,
                    fontWeight: FontWeight.w700,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Texts.textBlock(
                      "Login",
                      color: ColorConstants.whiteColor,
                      decoration: TextDecoration.underline,
                      size: screenWidth * 0.036,
                      fontFamily: "PoppinsRegular",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formSection(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntryField(
          controller: fullName,
          prefixIconWidget: Icon(
            Icons.person_outline,
            color: ColorConstants.iconColors,
            size: screenWidth * 0.045,
          ),
          hint: "Full Name",
        ),
        EntryField(
          controller: email,
          prefixIconWidget: Icon(
            Icons.email_outlined,
            color: ColorConstants.iconColors,
            size: screenWidth * 0.045,
          ),
          hint: "Email Address",
        ),
        Obx(
          () => EntryField(
            controller: password,
            prefixIconWidget: Icon(
              Icons.lock_outline_sharp,
              color: ColorConstants.iconColors,
              size: screenWidth * 0.045,
            ),
            hint: "Password",
            obscureText: authenticationController.obscured.value,
            suffixIcon: authenticationController.obscured.value
                ? Icons.remove_red_eye_outlined
                : CupertinoIcons.eye_slash,
            onTrailingTap: authenticationController.toggleObscured,
          ),
        ),
        Obx(
          () => EntryField(
            controller: confirmPassword,
            prefixIconWidget: Icon(
              Icons.lock_outline_sharp,
              color: ColorConstants.iconColors,
              size: screenWidth * 0.045,
            ),
            hint: "Confirm Password",
            obscureText: authenticationController.obscured.value,
            suffixIcon: authenticationController.obscured.value
                ? Icons.remove_red_eye_outlined
                : CupertinoIcons.eye_slash,
            onTrailingTap: authenticationController.toggleObscured,
          ),
        ),
        SizedBox(height: screenHeight * 0.03), // Widgets.heightSpaceH4
        CustomButton(
          label: "Register",
          fontSize: screenWidth * 0.04,
          textColor: ColorConstants.primaryColor,
          backgroundColor: ColorConstants.secandoryColor,
          radius: screenWidth * 0.065,
          onTap: () {
            // Call signup first
            authenticationController.signupUser(data: {
              "name": fullName.text,
              "email": email.text,
              "role": authenticationController.isHostSelected.value ? 2 : 1,
              "password": password.text,
              "password_confirmation": password.text,
            });

            // Navigate to VerificationView
            Get.to(() => VerificationView());
          },
        ),
      ],
    );
  }
}
