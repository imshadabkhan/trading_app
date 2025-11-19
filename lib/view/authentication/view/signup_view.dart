import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/padding_constants.dart';
import 'package:trading_app/core/utils/extensions.dart';
import 'package:trading_app/core/widgets/custom_button.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/entry_field.dart';
import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';
import '../controller/authentication_controller.dart';

class SignUpView extends StatelessWidget {
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Texts.textBold("Sign Up",
              color: ColorConstants.blackColor,
              size: 22,
              textAlign: TextAlign.start),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: ColorConstants.whiteColor,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.whiteColor,
        body: Padding(
          padding: PaddingConstants.screenPaddingHalf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formSection(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.textNormal("Already have an account?  ",
                      color: ColorConstants.greyTextColor, size: 12),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Texts.textBlock("Login",
                        color: ColorConstants.blackColor,
                        decoration: TextDecoration.underline,
                        size: 13,
                        fontFamily: "PoppinsRegular",
                        fontWeight: FontWeight.w600),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntryField(
          controller: email,
          prefixIcon: Assets.personIcon,
          hint: "Full Name",
        ),
        EntryField(
          controller: fullName,
          prefixIcon: Assets.emailIcon,
          hint: "Email Address",
        ),
        Obx(
          () => EntryField(
            controller: password,
            prefixIcon: Assets.lockIcon,
            hint: "password",
            obscureText: authenticationController.obscured.value,
            suffixIcon: authenticationController.obscured.value == false
                ? CupertinoIcons.eye_slash
                : Icons.remove_red_eye_outlined,
            onTrailingTap: () {
              authenticationController.toggleObscured();
            },
          ),
        ),
        Obx(
          () => EntryField(
            controller: confirmPassword,
            prefixIcon: Assets.lockIcon,
            hint: "Confirm Password",
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
        Widgets.heightSpaceH2,
        Row(
          children: [
            Obx(
              () => Expanded(
                child: CustomButton(
                  icon: Image.asset(
                    Assets.guitarIcon,
                    height: 20,
                    color: authenticationController.isHostSelected.value
                        ? Colors.black45
                        : ColorConstants.redColor,
                  ),
                  label: "Musician",
                  textColor: authenticationController.isHostSelected.value
                      ? Colors.black45
                      : ColorConstants.redColor,
                  radius: 10,
                  fontSize: 10,
                  backgroundColor: authenticationController.isHostSelected.value
                      ? Colors.transparent
                      : ColorConstants.redColorOpacity,
                  borderColor: authenticationController.isHostSelected.value
                      ? Colors.black45
                      : ColorConstants.redColor,
                  onTap: () {
                    authenticationController.toggleButton();
                  },
                ),
              ),
            ),
            Widgets.widthSpaceW2,
            Obx(
              () => Expanded(
                child: CustomButton(
                  icon: Image.asset(
                    Assets.clientIcon,
                    height: 20,
                    color: !authenticationController.isHostSelected.value
                        ? Colors.black45
                        : ColorConstants.redColor,
                  ),
                  label: "Client",
                  textColor: !authenticationController.isHostSelected.value
                      ? Colors.black45
                      : ColorConstants.redColor,
                  radius: 10,
                  fontSize: 10,
                  backgroundColor:
                      !authenticationController.isHostSelected.value
                          ? Colors.transparent
                          : ColorConstants.redColorOpacity,
                  borderColor: !authenticationController.isHostSelected.value
                      ? Colors.black45
                      : ColorConstants.redColor,
                  onTap: () {
                    authenticationController.toggleButton();
                  },
                ),
              ),
            ),
          ],
        ),
        Widgets.heightSpaceH3,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  fillColor:
                      WidgetStatePropertyAll(ColorConstants.redColorOpacity),
                  activeColor: ColorConstants.grayBorderColor,
                  checkColor: ColorConstants.redColor,
                  overlayColor: WidgetStatePropertyAll(Colors.red),
                  side: BorderSide(
                      color: ColorConstants.grayBorderColor, width: 2),
                  value: authenticationController.checkboxValue.value,
                  onChanged: (value) {
                    authenticationController.toggleCheckBox();
                  },
                ),
              ),
            ),
            Widgets.widthSpaceW2,
            Texts.textNormal("Agree to terms & conditions",
                size: 12, color: ColorConstants.greyTextColor)
          ],
        ),
        Widgets.heightSpaceH3,
        CustomButton(
          label: "Register",
          textColor: ColorConstants.whiteColor,
          backgroundColor: ColorConstants.primaryColor,
          radius: 10,
          onTap: () {
            authenticationController.signupUser(data: {
              "name": fullName.text,
              "email": email.text,
              "role":
                  authenticationController.isHostSelected.value == true ? 2 : 1,
              "password": password.text,
              "password_confirmation": password.text,
            });
          },
        ),
        Widgets.heightSpaceH2,
        Row(
          children: [
            const Expanded(
                child: Divider(
              color: Colors.black26,
              thickness: .5,
            )),
            Padding(
              padding: PaddingConstants.contentPadding,
              child: Container(
                child: Texts.textNormal("OR", color: Colors.black, size: 12),
              ),
            ),
            const Expanded(
              child: Divider(
                color: Colors.black26,
                thickness: .5,
              ),
            ),
          ],
        ),
        Widgets.heightSpaceH2,
        CustomButton(
          icon: Image.asset(
            Assets.gooogleIcon,
            height: 16,
            width: 16,
          ),
          label: "Continue With Google",
          textColor: ColorConstants.greyTextColor,
          backgroundColor: ColorConstants.grayFillColor,
          radius: 10,
          borderColor: ColorConstants.grayBorderColor,
          onTap: () {},
        ),
      ],
    );
  }
}
