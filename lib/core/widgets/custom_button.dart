import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;
  final bool isLoading; // 👈 NEW
  final List<BoxShadow>? shadow;

  const CustomButton({
    super.key,
    this.label,
    this.backgroundColor,
    this.icon,
    this.iconGap,
    this.onTap,
    this.fontSize,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
    this.borderColor,
    this.borderWidth,
    this.isLoading = false, // 👈 default false
    this.shadow = const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 2,
        spreadRadius: 1,
        offset: Offset(0, 2),
      )
    ],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap as void Function()?, // Disable tap
      child: Container(
        height: height ?? 45,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius ?? 8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? .6,
          ),
          boxShadow: shadow,
        ),
        padding: EdgeInsets.all(padding ?? 12),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: textColor ?? ColorConstants.whiteColor,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    if (icon != null) SizedBox(width: iconGap ?? 10),
                    Flexible(
                      child: Text(
                        label ?? 'Continue'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize ?? 16,
                          color: textColor ?? ColorConstants.whiteColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
