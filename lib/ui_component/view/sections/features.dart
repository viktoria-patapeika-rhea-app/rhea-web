import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    final double fontSize = deviceSize.width > 1024 ? 58 : 36;

    final activeTextStyle = GoogleFonts.orbitron(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );

    final inactiveTextStyle = GoogleFonts.orbitron(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: Color(0xFFCFCFCF).withOpacity(0.2),
    );
    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: deviceSize.width * 0.28),
            child: Text(
              'CYCLE TRACKING',
              style: inactiveTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: deviceSize.width * 0.21),
            child: Text(
              'DATA PRIVACY',
              style: inactiveTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: deviceSize.width * 0.14),
            child: Text(
              'FEATURES',
              style: activeTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: deviceSize.width * 0.07),
            child: Text(
              'DAILY INSIGHTS',
              style: inactiveTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              'WORKOUT PERSONALIZATION',
              style: inactiveTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
