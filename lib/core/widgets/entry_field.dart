import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';

import '../constants/color_constants.dart';

class EntryField extends StatelessWidget {
  final Color? labelColor;
  final Widget? prefixIconWidget;
  final String? hint;
  final String? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final TextCapitalization? textCapitalization;
  final BorderRadius? borderRadius;
  final Function()? onTrailingTap;
  final Function()? onTap;
  const EntryField({
    super.key,
    this.labelColor,
    this.prefixIconWidget,
    this.hint,
    this.prefixIcon,
    this.onTap,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.textCapitalization,
    this.borderRadius,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Texts.textBlock(
                        fontWeight: FontWeight.w600,
                        label ?? "",
                        size: 12,
                        color: labelColor),
                    if (trailingTitle != null)
                      GestureDetector(
                        onTap: onTrailingTap,
                        child: Text(
                          trailingTitle ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 20,
                                  color: ColorConstants.blackColor),
                        ),
                      )
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5),
        Container(
          alignment: Alignment.center,
          height: 45,
          child: TextFormField(
            onTap: onTap,
            obscureText: obscureText ?? false,
            controller: controller,
            validator: validator,
            onChanged: onChange,
            initialValue: initialValue,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly ?? false,
            maxLines: maxLines ?? 1,
            inputFormatters: inputFormatter,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforced ?? false
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            textAlign: textAlign ?? TextAlign.left,
            style: TextStyle(
                fontFamily: "PoppinsRegular",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorConstants.blackColor),
            keyboardType: textInputType,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 15,
                minHeight: 15,
              ),
              prefixIcon: prefixIconWidget != null
                  ? Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                          width: 17, height: 17, child: prefixIconWidget),
                    )
                  : prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 17,
                            height: 17,
                            child: Image.asset(prefixIcon ?? "",
                                fit: BoxFit.contain),
                          ),
                        )
                      : null,
              suffixIcon: suffixIcon != null
                  ? InkWell(
                      onTap: onTrailingTap,
                      child: Icon(suffixIcon,
                          size: 17, color: ColorConstants.iconColors),
                    )
                  : null,
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ColorConstants.textHintColor),
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
              fillColor: fillColor ?? ColorConstants.grayFillColor,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.greyTextColor),
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.grayBorderColor),
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(25)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.grayBorderColor),
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(25)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
