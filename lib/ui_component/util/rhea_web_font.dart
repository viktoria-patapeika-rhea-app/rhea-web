import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebFont {
  static double deviceWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  // Font sizes
  static double regularFontSize = deviceWidth > 1280
      ? 22
      : deviceWidth > 1024
          ? 20
          : deviceWidth > 768
              ? 18
              : 16;
  static double titleFontSize = deviceWidth > 1280
      ? 48
      : deviceWidth > 1024
          ? 36
          : deviceWidth > 32
              ? 26
              : 22;
  // Font weights
  static FontWeight regularFontWeight = FontWeight.w500;
  // Font styles
  static TextStyle regularFont = GoogleFonts.mavenPro(
      fontSize: regularFontSize, color: RheaWebColor.regularTextColor, fontWeight: FontWeight.w700);
  static TextStyle lightFont = GoogleFonts.mavenPro(
      fontSize: regularFontSize, color: RheaWebColor.regularTextColor, fontWeight: FontWeight.w300);

  static TextStyle logoFont =
      GoogleFonts.mavenPro(fontSize: 36, fontWeight: FontWeight.bold, color: RheaWebColor.semanticWhiteColor);
}
