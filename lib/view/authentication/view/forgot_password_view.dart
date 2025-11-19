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
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(title: Texts.textBold("Forget Password",size: 22),elevation: 0,scrolledUnderElevation: 0,backgroundColor: ColorConstants.whiteColor,centerTitle: true,),

        body: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              

              Widgets.heightSpaceH05,
              Center(child: Texts.textNormal(
                  "You’ll receive 6 digit code on your email address",
                  color: ColorConstants.greyTextColor,
                  size: 11),),

              Widgets.heightSpaceH4,
              EntryField(
                label: "Email Address",
                prefixIcon:Assets.emailIcon ,
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hint: "Type your email",
                // prefixIcon: Assets.mailIcon,
              ),
              Spacer(),
              CustomButton(
                label: "Verify",
                textColor: ColorConstants.whiteColor,
                backgroundColor: ColorConstants.primaryColor,
                radius: 10,
                onTap: () {
                  Get.to(()=>VerificationView());
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
