import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebFont {
  static double deviceWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  // Font sizes
  static const double titleFontSize = 40;
  static const double subtitleFontSize = 22;
  static const double regularFontSize = 16;
  static const double smallFontSize = 14;
  // Font weights
  static FontWeight regularFontWeight = FontWeight.w500;
  static FontWeight titleFontWeight = FontWeight.bold;
  // Font styles
  static TextStyle regularFont = GoogleFonts.openSans(
      fontSize: regularFontSize, color: RheaWebColor.regularTextColor, fontWeight: regularFontWeight);
  static TextStyle smallFont = GoogleFonts.openSans(
      fontSize: smallFontSize, color: RheaWebColor.regularTextColor, fontWeight: FontWeight.w200);
  static TextStyle titleFont =
      GoogleFonts.openSans(fontSize: titleFontSize, color: RheaWebColor.regularTextColor, fontWeight: titleFontWeight);
}
