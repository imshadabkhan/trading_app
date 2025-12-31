import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/core/widgets/entry_field.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final h = Get.height;
    final w = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Texts.textBold(
          "Edit Profile",
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
          size: w * 0.05,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(Assets.images5),
                  ),
                  SizedBox(height: 10),
                  Texts.textMedium("MK ALI TRADER",
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                      size: h * 0.022),
                ],
              ),
              Widgets.heightSpaceH5,
              EntryField(
                fillColor: ColorConstants.whiteColor,
                label: 'Name',
                borderRadius: BorderRadius.circular(10),
                // controller: fullName,
                prefixIconWidget: Icon(
                  Icons.person_outline,
                  color: ColorConstants.iconColors,
                  size: w * 0.045,
                ),
                hint: "MK Ali Trader",
              ),
              EntryField(
                fillColor: ColorConstants.whiteColor,

                label: 'Email',
                borderRadius: BorderRadius.circular(10),
                // controller: email,
                prefixIconWidget: Icon(
                  Icons.email_outlined,
                  color: ColorConstants.iconColors,
                  size: w * 0.045,
                ),
                hint: "Mk Ali trader444@gmail.com",
              ),
              EntryField(
                fillColor: ColorConstants.whiteColor,

                label: 'Contact',
                borderRadius: BorderRadius.circular(10),
                // controller: email,
                prefixIconWidget: Icon(
                  Icons.phone_outlined,
                  color: ColorConstants.iconColors,
                  size: w * 0.045,
                ),
                hint: "+923374839399",
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      width: w * 0.2,
                      height: h * 0.05,
                      radius: 10,
                      backgroundColor: ColorConstants.whiteColor,
                      shadow: [],
                      textColor: ColorConstants.primaryColor,
                      label: "Cancel",
                      borderWidth: 1,
                      borderColor: ColorConstants.primaryColor,
                      fontSize: w * 0.03,
                      onTap: () {
                        // Save changes logic here
                      },
                    ),
                  ),
                  Widgets.widthSpaceW4,
                  Expanded(
                    child: CustomButton(
                      width: w * 0.2,
                      height: h * 0.05,
                      fontSize: w * 0.03,
                      radius: 10,
                      shadow: [],
                      backgroundColor: ColorConstants.primaryColor,
                      label: "Save Changes",
                      onTap: () {
                        // Save changes logic here
                      },
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
