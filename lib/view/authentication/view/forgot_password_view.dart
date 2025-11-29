import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/view/authentication/view/verification_view.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/entry_field.dart';

import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  AuthenticationController authenticationController = Get.find();
  TextEditingController emailController = TextEditingController();

  ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.chevron_left,
              color: Colors.white,)),
          title: Texts.textBold("Forget Password",
            size: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: ColorConstants.primaryColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgets.heightSpaceH05,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Texts.textMedium(
                      "You’ll receive 6 digit code \n          on your email ",
                      color: ColorConstants.whiteColor,
                      size: 14,
                  fontWeight: FontWeight.w500),
                ),
              ),
              Widgets.heightSpaceH1,
              EntryField(
                label: "Email Address",
                labelColor: Colors.white,
                prefixIconWidget: Icon(Icons.person_outline,
                  color: ColorConstants.iconColors,
                size: 18,),
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hint: "MK ALI Trader",
                // prefixIcon: Assets.mailIcon,
              ),
              Widgets.heightSpaceH1,
              CustomButton(
                label: "Verify",
                textColor: ColorConstants.primaryColor,
                fontSize: 14,
                backgroundColor: ColorConstants.secandoryColor,
                radius:25,
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
