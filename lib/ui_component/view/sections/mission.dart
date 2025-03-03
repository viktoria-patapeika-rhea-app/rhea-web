import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final screenWidth = deviceSize.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 58.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;

    return Container(
      padding: EdgeInsets.only(left: screenWidth < 900 ? 40 : 140),
      width: deviceSize.width,
      height: deviceSize.height,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: GoogleFonts.orbitron(
                fontSize: titleFontSize,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'EMPOWERING\nHEALTH,\nREDEFINING\nFITNESS'),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Container(
            constraints: BoxConstraints(maxWidth: 800), // Limit text width for readability
            child: Text(
              'Rhea is on a mission to transform women\'s health and fitness by leveraging the power of AI.\n\n'
              'Our vision is to bring science-backed, personalized solutions that empower women to embrace their unique hormonal rhythms.\n\n'
              'With a focus on personalization, empowerment, and privacy, Rhea is more than an app—it\'s your health ally.',
              style: GoogleFonts.exo2(
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
