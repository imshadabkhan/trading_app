import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trading_app/core/routes/app_routes.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/view/authentication/view/signup_view.dart';
import 'package:trading_app/view/home-screens/home-screen.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart' show PaddingConstants;
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/entry_field.dart';

import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';
import 'forgot_password_view.dart';

class LoginView extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric( vertical: 137),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Widgets.heightSpaceH05,
              Image.asset(
                "assets/images/logo.png",
                width: 120,
                height: 120,
              ),
              Widgets.heightSpaceH5,
              formSection(),
              Widgets.heightSpaceH3,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textBold("Don't have an account?  ",
                      color: Colors.white,
                      size: 13,
                      fontWeight: FontWeight.w900),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpView());
                    },
                    child: Texts.textBlock("Signup",
                        color: ColorConstants.whiteColor,
                        size: 13,
                        decoration: TextDecoration.underline,
                        fontFamily: "PoppinsRegular",
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Widgets.heightSpaceH2,
            ],
          ),
        ),
      ),
    );
  }

  formSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Texts.textBold("Welcome Back To \n Trading App",
              color: ColorConstants.whiteColor,
              size: 20,
              fontWeight: FontWeight.w600),
          Widgets.heightSpaceH5,

          EntryField(

            color: ColorConstants.whiteColor,
            controller: emailController,
            prefixIconWidget: Icon(
              Icons.email_outlined,
              color: ColorConstants.iconColors, // same as eye icon color
              size: 17,
            ),
            hint: "Email Address",
          ),

          Obx(
            () => EntryField(
              controller: passwordController,
              prefixIconWidget: Icon(
                Icons.lock_outline_sharp,
                color: ColorConstants.iconColors,
                size: 17,
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
          Widgets.heightSpaceH1,
          GestureDetector(
            onTap: () {
              Get.to(() => ForgotPasswordView());
            },
            child: Align(
              alignment: Alignment.center,
              child: Texts.textBlock(
                "Forgot Password?",
                color: Colors.white,
                decoration: TextDecoration.underline,
                size: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Widgets.heightSpaceH5,
         // Widgets.heightSpaceH2,
          //Widgets.heightSpaceH2,
          CustomButton(
            label: "Login",

            textColor: ColorConstants.primaryColor,
            backgroundColor: ColorConstants.secandoryColor,
            radius: 25,
            //borderColor: ColorConstants.grayBorderColor,
            onTap: () {
              Get.to(HomeScreen());
            },
          ),
        ],
      ),
    );
  }
}
