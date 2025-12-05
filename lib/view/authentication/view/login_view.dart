import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/routes/app_routes.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/view/authentication/view/signup_view.dart';
import 'package:trading_app/view/home-screens/bottom-nav-controller.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
// import '../../../core/constants/padding_constants.dart' show PaddingConstants;
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/entry_field.dart';
import '../../../core/widgets/text_widgets.dart';
import '../controller/authentication_controller.dart';

class LoginView extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.09),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.logo,
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
              ),
              SizedBox(height: screenHeight * 0.04),
              formSection(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textBold(
                    "Don't have an account?  ",
                    color: ColorConstants.whiteColor,
                    size: screenWidth * 0.034,
                    fontWeight: FontWeight.w900,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpView());
                    },
                    child: Texts.textBlock(
                      "Signup",
                      color: ColorConstants.whiteColor,
                      size: screenWidth * 0.034,
                      decoration: TextDecoration.underline,
                      fontFamily: "PoppinsRegular",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  formSection(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Texts.textBold(
            "Welcome Back To \n Trading App",
            color: ColorConstants.whiteColor,
            size: screenWidth * 0.03,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: screenHeight * 0.035),
          EntryField(
            color: ColorConstants.whiteColor,
            controller: emailController,
            prefixIconWidget: Icon(
              Icons.email_outlined,
              color: ColorConstants.iconColors,
              size: screenWidth * 0.043,
            ),
            hint: "Email Address",
          ),
          Obx(
            () => EntryField(
              controller: passwordController,
              prefixIconWidget: Icon(
                Icons.lock_outline_sharp,
                color: ColorConstants.iconColors,
                size: screenWidth * 0.043,
              ),
              hint: "Password",
              obscureText: authenticationController.obscured.value,
              suffixIcon: authenticationController.obscured.value == false
                  ? CupertinoIcons.eye_slash
                  : Icons.remove_red_eye_outlined,
              onTrailingTap: () {
                authenticationController.toggleObscured();
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          GestureDetector(
            onTap: () => Get.toNamed(RoutesName.forgotPassword),
            child: Align(
              alignment: Alignment.center,
              child: Texts.textBlock(
                "Forgot Password?",
                color: ColorConstants.whiteColor,
                decoration: TextDecoration.underline,
                size: screenWidth * 0.033,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          CustomButton(
            label: "Login",
            textColor: ColorConstants.primaryColor,
            backgroundColor: ColorConstants.secandoryColor,
            radius: screenWidth * 0.065,
            onTap: () {
              Get.to(MainNavController());
            },
          ),
        ],
      ),
    );
  }
}
