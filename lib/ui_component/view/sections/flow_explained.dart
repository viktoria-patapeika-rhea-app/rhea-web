import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlowExplained extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final screenWidth = deviceSize.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 58.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final iconSize = screenWidth < 900 ? 64.0 : 84.0;

    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      color: Colors.transparent,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'HOW\nRHEA\nWORKS',
              style: GoogleFonts.orbitron(fontSize: titleFontSize, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/heart_list.svg',
                          color: Color(0xffE777F5),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1.',
                          style: GoogleFonts.exo2(
                            color: Colors.white,
                            fontSize: descriptionFontSize,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: screenWidth < 900 ? 160 : 305,
                          child: Text(
                            'Tell us about your cycle, preferences, and health needs you want us to consider.',
                            style: GoogleFonts.exo2(
                              color: Colors.white,
                              fontSize: descriptionFontSize,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Row 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2.',
                          style: GoogleFonts.exo2(
                            color: Colors.white,
                            fontSize: descriptionFontSize,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: screenWidth < 900 ? 160 : 305,
                          child: Text(
                            'Our AI analyzes your data to provide personalized recommendations.',
                            style: GoogleFonts.exo2(
                              color: Colors.white,
                              fontSize: descriptionFontSize,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/cpu.svg',
                          color: Color(0xffE777F5),
                        ),
                      ),
                    ),
                  ],
                ),

                // Row 3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/dumbbell.svg',
                          color: Color(0xffE777F5),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3.',
                          style: GoogleFonts.exo2(
                            color: Colors.white,
                            fontSize: descriptionFontSize,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: screenWidth < 900 ? 160 : 305,
                          child: Text(
                            'Get customized fitness plans, track your progress, and adjust workouts.',
                            style: GoogleFonts.exo2(
                              color: Colors.white,
                              fontSize: descriptionFontSize,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ]),
    );
  }
}
