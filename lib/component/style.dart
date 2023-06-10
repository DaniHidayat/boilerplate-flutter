import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Style {
  static Color mainColor = const Color(0xFFFFFFFF);
  static Color secondColor = const Color(0xFF1430C3).withOpacity(0.92);
  static Color thirdColor = const Color(0xff354CC2).withOpacity(0.90);
  static Color text1Color = const Color(0xFFFFFFFF);
  static Color text2Color = const Color(0xff001582);
  static Color text3Color = Colors.black;
  static Color text4Color = const Color(0xFF51B254);
  static Color text5Color = const Color(0xFFFA3838);
  static Color text6Color = const Color(0xFF8A8A8A);

  static LinearGradient btnGradient = const LinearGradient(
      colors: [
        Color(0xFFF7C61A),
        Color(0xFFF3D226),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
  static String font = "Arial";

  static TextStyle style10(Color color) => TextStyle(
      color: color,
      fontFamily: Style.font,
      fontSize: 10,
      fontWeight: FontWeight.w400);
  static TextStyle style12(Color color) => TextStyle(
      color: color,
      fontFamily: Style.font,
      fontSize: 12,
      fontWeight: FontWeight.w400);
  static TextStyle style14(Color color) => TextStyle(
      color: color,
      fontFamily: Style.font,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static TextStyle style18(Color color) => TextStyle(
      color: color,
      fontFamily: Style.font,
      fontSize: 18,
      fontWeight: FontWeight.w700);

  static appbarCustom(String text) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Style.text1Color,
            )),
        title: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Style.text1Color,
              fontFamily: Style.font,
              fontSize: 16),
        ),
      );
}
