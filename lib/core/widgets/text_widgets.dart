import 'package:flutter/material.dart';

import '../constants/color_constants.dart';


class Texts {
  static textBold(String label,
      {double? size, Color? color, FontWeight? fontWeight, textAlign,int? maxlines,TextOverflow? overFlow}) {
    return Text(
      label,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxlines??1,
      overflow: overFlow,
      style: TextStyle(

        fontSize: size ?? 22,
        fontFamily: "Oranienbaum",
        fontWeight: fontWeight ?? FontWeight.w400,


        color: color ?? Colors.black,
      ),
    );
  }

  static textNormal(String label,
      { var maxLines,double? size, Color? color, String? fontFamily, textAlign, overflow,var decoration,var fontWeight,var textBaseline,decorationColor}) {
    return Text(
      label,
      maxLines: maxLines??3,
      overflow: overflow,
      style: TextStyle(

        decoration: decoration,
        decorationColor: decorationColor,
        textBaseline: textBaseline,
        fontSize: size ?? 12.0,
        fontWeight: fontWeight??FontWeight.w400,
        fontFamily: "InterRegular",
        color: color ?? ColorConstants.blackColor,
      ),
      textAlign: textAlign ?? TextAlign.center,

    );
  }

  static textMedium(

      String label,
      {TextAlign? textAlign,int? maxLines,double? size, Color? color, String? fontFamily, fontWeight,TextDecoration? decoration,decorationColor}) {
    return Text(
      textAlign:textAlign??TextAlign.start,
      label,
      maxLines: maxLines??1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(

          fontWeight: fontWeight??FontWeight.w600,
          fontSize: size ?? 14.0,
          fontFamily: "InterMedium",
          decoration: decoration,
          decorationColor:decorationColor??Colors.white ,


          color: color ?? Colors.black),
    );
  }

  static textUrbanistCenter(String label,
      {double? size,
        Color? color,
        FontWeight? fontWeight,
        String? fontFamily}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size ?? 18.0,
        fontFamily: fontFamily ?? "InstrumentSansRegular",
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  static textBlock(String label,
      {double? size,
        Color? color,
        FontWeight? fontWeight,
        String? fontFamily,
        var overflow,
        int? maxline,
        var align,
        var decoration
      }) {
    return Text(
      label,
      style: TextStyle(
        decoration: decoration,

        fontSize: size ?? 18.0,
        fontFamily: fontFamily ?? "PoppinsRegular",
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black,

      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.start,
      maxLines: maxline ?? 1,
    );
  }

  static textUnderlineBlock(String label,
      {double? size,
        Color? color,
        FontWeight? fontWeight,
        String? fontFamily,
        var overflow,
        int? maxline,
        bool? underline}) {
    return Text(
      label,
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: size ?? 18.0,
          fontFamily: fontFamily ?? "InstrumentSansRegular",
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.black),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxline ?? 1,
    );
  }
}
