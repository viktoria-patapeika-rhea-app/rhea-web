import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebFont {
  static double deviceWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  // Font sizes
  static double titleFontSize = deviceWidth <= 1080 ? 32 : 44;
  static double subtitleFontSize = deviceWidth <= 1080 ? 18 : 26;
  static double regularFontSize = deviceWidth <= 1080 ? 14 : 18;
  static double smallFontSize = deviceWidth <= 1080 ? 12 : 16;
  static double titleSmallFontSize = deviceWidth <= 1080 ? 26 : 36;
  // Font weights
  static FontWeight lightFontWeight = FontWeight.w200;
  static FontWeight regularFontWeight = FontWeight.w500;
  static FontWeight titleFontWeight = FontWeight.bold;
  // Font styles
  static TextStyle regularFont = GoogleFonts.openSans(
      fontSize: regularFontSize, color: RheaWebColor.regularTextColor, fontWeight: regularFontWeight);
  static TextStyle smallFont =
      GoogleFonts.openSans(fontSize: smallFontSize, color: RheaWebColor.regularTextColor, fontWeight: FontWeight.w200);
  static TextStyle smallFontBold = GoogleFonts.openSans(
      fontSize: smallFontSize, color: RheaWebColor.regularTextColor, fontWeight: regularFontWeight);
  static TextStyle titleFont =
      GoogleFonts.montserrat(fontSize: titleFontSize, color: RheaWebColor.regularTextColor, fontWeight: titleFontWeight);

  static TextStyle titleSmallFont = GoogleFonts.montserrat(
      fontSize: titleSmallFontSize, color: RheaWebColor.regularTextColor, fontWeight: titleFontWeight);
}
