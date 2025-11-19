import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../constants/color_constants.dart';
import '../widgets/text_widgets.dart';


class Widgets {
  static var heightSpaceH05 =const SizedBox(
    height: 2,
  );
  static var heightSpaceH1 = const SizedBox(
    height: 5,
  );
  static var heightSpaceH2 = const SizedBox(
    height: 10,
  );
  static var heightSpaceH3 = const SizedBox(
    height: 15,
  );
  static var heightSpaceH4 =const  SizedBox(
    height: 20,
  );
  static var heightSpaceH5 = const SizedBox(
    height: 25,
  );
  static var widthSpaceW05 =const SizedBox(
    width: 2,
  );
  static var widthSpaceW1 = const SizedBox(
    width: 7,
  );
  static var widthSpaceW2 =const  SizedBox(
    width: 10,
  );
  static var widthSpaceW3 =const SizedBox(
    width: 15,
  );
  static var widthSpaceW4 =const SizedBox(
    width: 20,
  );






  static final cardBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        // color: Colors.black12.withOpacity(.03),
        spreadRadius: 3,
        blurRadius: 3,
        // changes position of shadow
      ),
    ],
  );
  static final searchBox = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        // color: Colors.black12.withOpacity(.03),
        spreadRadius: 3,
        blurRadius: 3,
        // changes position of shadow
      ),
    ],
  );
  static noFound(String title) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
        ));
  }

  static var blockDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey, // Light grey shadow
        spreadRadius: 1, // How much the shadow spreads
        blurRadius: 10, // How soft the shadow looks
        offset: Offset(0, 3), // Positioning (horizontal, vertical)
      ),
    ],
  );
  static customDivider(
      {bool isVertical = false,
        Color? color,
        double? padding,
        double? thickness}) {
    return Padding(
      padding: padding != null
          ? EdgeInsets.symmetric(vertical: padding)
          : const EdgeInsets.only(top: 5.0),
      child: isVertical
          ? VerticalDivider(
        thickness: 1.0,
        color: color ?? Colors.black12,
      )
          : Divider(
        height: 1.0,
        thickness: thickness ?? 1.0,
        color: color ?? Colors.black12,
      ),
    );
  }

  static Widget chatCard({
    required String name,
    required String message,
    required String time,
    required String image,
    required int unreadCount,
  }) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => ChatView());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(image),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 1.0, bottom: 3.0),
                    child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green,
                        ))),
              ],
            ),
            Widgets.widthSpaceW3,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.textBlock(name, size: 13, fontWeight: FontWeight.w600),
                  Widgets.heightSpaceH1,
                  Texts.textNormal(message,
                      size: 12,
                      color: ColorConstants.blackColor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.black45,
                      fontFamily: "InstrumentSansRegular"),
                ),
                SizedBox(
                  height: 4,
                ),
                if (unreadCount > 0)
                  CircleAvatar(
                    backgroundColor: ColorConstants.primaryColor,
                    radius: 3,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static buildRatingStar(num starValue, {bool? isCenter, double? size}) {
    Color color = starValue < 2 ? ColorConstants.primaryColor : ColorConstants.primaryColor;
    var starIconsMap = [1, 2, 3, 4, 5].map((e) {
      if (starValue >= e) {
        return Icon(
          Icons.star_rate,
          color: color,
          size: size ?? 14,
        );
      } else if (starValue < e && starValue > e - 1) {
        return Icon(
          Icons.star_half,
          size: size ?? 14,
          color: color,
        );
      } else {
        return Icon(
          Icons.star_border,
          color: color,
          size: size ?? 14,
        );
      }
    }).toList();

    return Row(
        mainAxisAlignment: isCenter ?? false
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: starIconsMap);
  }

  // static Widget networkImage(String url,
  //     {double? height, double? width, int? cacheSize}) {
  //   return CachedNetworkImage(
  //     imageUrl: url,
  //     fit: BoxFit.cover,
  //     height: height,
  //     width: width,
  //     memCacheHeight: cacheSize,
  //     memCacheWidth: cacheSize,
  //     progressIndicatorBuilder: (context, url, downloadProgress) => Center(
  //         child: CircularProgressIndicator(value: downloadProgress.progress)),
  //     errorWidget: (context, url, error) => Image.asset(
  //       Assets.placeholder,
  //       fit: BoxFit.cover,
  //       height: height,
  //       width: width,
  //     ),
  //   );
  // }

  static profileMenu(
      {required String text,
        required IconData icon,
        required Callback press,
        required bool? isBadge,
        String? count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ColorConstants.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            Stack(
              children: [
                Icon(icon),
                Positioned(
                    right: 0,
                    top: 0,
                    child: isBadge == true
                        ? CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 6,
                      child: Text(
                        count!,
                        style:
                        TextStyle(fontSize: 7, color: Colors.white),
                      ),
                    )
                        : const SizedBox.shrink())
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackBar(String title, String message) {
    Get.snackbar(
      icon: Icon(
        title != "Success" ? Icons.info_outline : Icons.check_circle_outline,
        color: Colors.white,
      ),
      title,
      borderColor: Colors.white,
      borderWidth: 5,
      message,
      backgroundColor: title != "Success" ? Colors.red : Colors.green,
      colorText: Colors.white,
    );
  }


  static Widget assetImage(String url, double width, double height) {
    return Image.asset(url, fit: BoxFit.cover, width: width, height: height);
  }

  static AppBar customAppBar({String? title, Widget? action}) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          )),
      centerTitle: true,
      title:
      Texts.textMedium(title ?? "", size: 15, fontWeight: FontWeight.w500),
      actions: [action ?? SizedBox.shrink()],
    );
  }


  static Widget divider({bool isVertical = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: isVertical
          ? const VerticalDivider(thickness: 1.0, color: Colors.black12)
          :  Divider(height: 1.0, thickness: 0.5, color: Colors.grey.shade500),
    );
  }

  // static void showLoader(String message) {
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..backgroundColor = ColorConstants.primaryColor
  //     ..indicatorColor = Colors.white
  //     ..textColor = Colors.white
  //     ..maskColor = ColorConstants.primaryColor
  //     ..dismissOnTap = false;
  //
  //   EasyLoading.show(
  //     maskType: EasyLoadingMaskType.none,
  //     indicator: const CircularProgressIndicator(color: Colors.white),
  //     status: message,
  //   );
  // }

  static Future<bool> confirmationDialogue(
      BuildContext context, String title, String content) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: Text('No',
                  style: TextStyle(color: ColorConstants.primaryColor)),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: Text('Yes',
                  style: TextStyle(color: ColorConstants.primaryColor)),
            ),
          ],
        );
      },
    ) ??
        false;
  }

  static void openMoreOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // --- HANDLE BAR ---
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              optionTile(
                text: "Follow",
                onTap: () {
                  Navigator.pop(context);
                  print("Follow clicked");
                },
              ),

              optionTile(
                text: "View Profile",
                onTap: () {
                  Navigator.pop(context);
                  print("View Profile clicked");
                },
              ),

              optionTile(
                text: "Message",
                onTap: () {
                  Navigator.pop(context);
                  print("Message clicked");
                },
              ),
              Widgets.heightSpaceH3,
            ],
          ),
        );
      },
    );
  }
  static Widget optionTile({

    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Texts.textMedium(text, size: 14),
          ],
        ),
      ),
    );
  }

}
