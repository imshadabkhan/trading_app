import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';

class SmallTopHeader extends StatelessWidget {
  final double labelHeight;
  final Icon icon;
  final VoidCallback? iconOnTap;

  const SmallTopHeader({
    super.key,
    this.labelHeight = 130,
    this.icon = const Icon(Icons.menu, color: Colors.white, size: 28),
    this.iconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SizedBox(
        height: labelHeight * (h / 800),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: double.infinity,
            height: 130 * (h / 800),
            padding: EdgeInsets.only(
              top: h * 0.06,
              left: w * 0.05,
              right: w * 0.05,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: iconOnTap,
                      child: icon,
                    ),
                    // Builder(
                    //   builder: (context) => GestureDetector(
                    //     onTap: () => Scaffold.of(context).openDrawer(),
                    //     child: Icon(
                    //       Icons.menu,
                    //       color: ColorConstants.whiteColor,
                    //       size: w * 0.07,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Icon(Icons.notifications,
                            color: ColorConstants.whiteColor,
                            size: 28 * (w / 400)),
                        SizedBox(width: 10 * (w / 400)),
                        Container(
                          padding: EdgeInsets.all(2 * (w / 400)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorConstants.whiteColor.withOpacity(.7),
                              width: 2 * (w / 400),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 18 * (w / 400),
                            backgroundImage: AssetImage(
                              Assets.images5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
