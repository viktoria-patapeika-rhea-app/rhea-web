import 'package:flutter/material.dart';

class RheaWebColor {
  // Primary colors
  static const Color primaryColor = semanticWhiteColor;
  // Semantic colors
  static const Color semanticWhiteColor = Colors.white;
  static const Color semanticPurpleColor = Color(0xff1A237E);
  static const Color semanticRedColor = Color(0xffFF6F61);
  static const Color semanticGreenColor = Color(0xff00B894);
  static const Color semanticYellowColor = Color(0xffFBC02D);
  static const Color semanticPinkColor = Color(0xffFFCCBC);

  // Text colots
  static const Color regularTextColor = Colors.black87;
  static const Color accentTextColor = semanticWhiteColor;
  // Primary styles
  // Shadows
  static BoxShadow logoShadow = BoxShadow(
      color: semanticRedColor.withOpacity(0.6), offset: const Offset(0, 4), blurRadius: 250, spreadRadius: 500);
  static BoxShadow bottomShadow = BoxShadow(
      color: semanticGreenColor.withOpacity(0.6), offset: const Offset(0, 4), blurRadius: 160, spreadRadius: 300);
  // Gradients
}
