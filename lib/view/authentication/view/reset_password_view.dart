import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/view/authentication/view/login_view.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/entry_field.dart';
import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';

class ResetPasswordView extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthenticationController authenticationController = Get.find();

  ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive screen dimensions
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: GetBuilder(
        init: authenticationController,
        builder: (_) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstants.primaryColor,
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: ColorConstants.whiteColor,
                  size: screenWidth * 0.07,
                ),
                onPressed: () => Get.back(),
              ),
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: ColorConstants.primaryColor,
              title: Texts.textBold(
                "Create New Password",
                color: ColorConstants.whiteColor,
                textAlign: TextAlign.center,
                size: screenWidth * 0.058,
                fontWeight: FontWeight.w600,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: screenHeight * 0.04), // Widgets.heightSpaceH5
                    Texts.textNormal(
                      "Please create your new password",
                      color: ColorConstants.whiteColor,
                      textAlign: TextAlign.center,
                      size: screenWidth * 0.037,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                        height: screenHeight * 0.04), // Widgets.heightSpaceH5
                    EntryField(
                      label: "Password",
                      labelColor: ColorConstants.whiteColor,
                      controller: passwordController,
                      hint: "Type your new password",
                      prefixIconWidget: Icon(
                        Icons.lock_outline_sharp,
                        color: ColorConstants.iconColors,
                        size: screenWidth * 0.045,
                      ),
                      obscureText: authenticationController.obscured.value,
                      suffixIcon:
                          authenticationController.obscured.value == false
                              ? CupertinoIcons.eye_slash
                              : Icons.remove_red_eye_outlined,
                      onTrailingTap: () {
                        authenticationController.toggleObscured();
                      },
                    ),
                    EntryField(
                      label: 'Confirm Password',
                      labelColor: ColorConstants.whiteColor,
                      controller: confirmPasswordController,
                      hint: "Type your confirm password",
                      prefixIconWidget: Icon(
                        Icons.lock_outline_sharp,
                        color: ColorConstants.iconColors,
                        size: screenWidth * 0.045,
                      ),
                      obscureText: authenticationController.obscured.value,
                      suffixIcon:
                          authenticationController.obscured.value == false
                              ? CupertinoIcons.eye_slash
                              : Icons.remove_red_eye_outlined,
                      onTrailingTap: () {
                        authenticationController.toggleObscured();
                      },
                    ),
                    SizedBox(
                        height: screenHeight * 0.015), // Widgets.heightSpaceH1
                    CustomButton(
                      backgroundColor: ColorConstants.secandoryColor,
                      radius: screenWidth * 0.065,
                      textColor: ColorConstants.whiteColor,
                      label: "Change",
                      onTap: () {
                        Get.to(LoginView());
                        if (passwordController.text.length < 6) {
                          Widgets.showSnackBar(
                            "Incomplete Form",
                            "Please enter password min length 6 characters",
                          );
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          Widgets.showSnackBar(
                            "Incomplete Form",
                            "Passwords are not matching",
                          );
                        } else {
                          authenticationController
                              .resetForgotPassword(passwordController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
