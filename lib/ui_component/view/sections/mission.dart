import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 140),
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
                fontSize: 64,
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
                fontSize: 18,
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