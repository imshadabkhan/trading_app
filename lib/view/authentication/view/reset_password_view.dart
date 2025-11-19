import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/core/widgets/custom_button.dart';


import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';
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
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: GetBuilder(
          init: authenticationController,
          builder: (_) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstants.whiteColor,
              appBar: AppBar(
                elevation: 0,scrolledUnderElevation: 0,backgroundColor: ColorConstants.whiteColor,
                title:   Texts.textBold(
                "Create New Password",
                color: ColorConstants.blackColor,textAlign: TextAlign.center,
                size: 22,),),

              body: SafeArea(
                child: Padding(
                  padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Texts.textNormal(
                          "Please create your new password",
                          color: ColorConstants.greyTextColor,textAlign: TextAlign.center,
                          size: 11),
                      Widgets.heightSpaceH5,
                      EntryField(
                        label: "Password",
                        controller: passwordController,
                        hint: "Type your new password",
                         prefixIcon: Assets.lockIcon,
                        obscureText: authenticationController.obscured.value,
                        suffixIcon:
                            authenticationController.obscured.value == false
                                ? CupertinoIcons.eye_slash
                                : Icons.remove_red_eye_outlined,
                        onTrailingTap: () {
                          authenticationController.toggleObscured();
                        },
                      ),
                      Widgets.heightSpaceH2,
                      EntryField(

                        label: 'Confirm Password',
                        controller: confirmPasswordController,
                        hint: "Type your confirm password",
                         prefixIcon: Assets.lockIcon,
                        obscureText: authenticationController.obscured.value,
                        suffixIcon:
                            authenticationController.obscured.value == false
                                ? CupertinoIcons.eye_slash
                                : Icons.remove_red_eye_outlined,
                        onTrailingTap: () {
                          authenticationController.toggleObscured();
                        },
                      ),
                      Spacer(),
                      CustomButton(

                        backgroundColor: ColorConstants.primaryColor,

                        radius: 10,
                        textColor: ColorConstants.whiteColor,
                        label: "Change",
                        onTap: () {
                          if (passwordController.text.length < 6) {
                            Widgets.showSnackBar("Incomplete Form",
                                "Please enter password min length 6 characters");
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            Widgets.showSnackBar("Incomplete Form",
                                "Passwords are not matching");
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
          }),
    );
  }
}
