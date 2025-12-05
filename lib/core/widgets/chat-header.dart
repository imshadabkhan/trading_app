import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return AppBar(
      toolbarHeight: height * 0.10,
      backgroundColor: ColorConstants.primaryColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.05),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  size: width * 0.06,
                  color: ColorConstants.whiteColor,
                ),
                onPressed: () => Get.back(),
              ),
              Container(
                height: height * 0.04,
                width: height * 0.04,
                margin: EdgeInsets.only(right: width * 0.02),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(width * 0.02),
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.logo,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "MK Ali Trader",
                          style: TextStyle(
                            color: ColorConstants.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                        ),
                        Widgets.widthSpaceW1,
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.015,
                              vertical: height * 0.003),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    ColorConstants.blackColor.withOpacity(.25),
                                blurRadius: width * 0.015,
                              )
                            ],
                            color: ColorConstants.secandoryColor,
                            borderRadius: BorderRadius.circular(width * 0.03),
                          ),
                          child: Text(
                            "Premium",
                            style: TextStyle(
                              color: ColorConstants.blackColor,
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Widgets.heightSpaceH05,
                    Text(
                      "180 subscribers",
                      style: TextStyle(
                        color: ColorConstants.whiteColor,
                        fontSize: width * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: ColorConstants.whiteColor,
                  size: width * 0.06,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
