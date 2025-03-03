import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppScreenshots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final screenWidth = deviceSize.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 58.0;

    // For phone mockup sizing
    final mockupWidth = screenWidth < 900
        ? screenWidth * 0.35 // Smaller on small screens to fit side by side
        : screenWidth * 0.15;
    final mockupHeight = mockupWidth * 2.1; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth < 900 ? 16 : 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flex space before title (like other pages)
            Spacer(flex: 6),

            // Title
            Text(
              'THE RHEA\nEXPERIENCE',
              style: GoogleFonts.orbitron(
                fontSize: titleFontSize,
                color: Colors.white,
              ),
            ),

            // Space between title and mockups
            Spacer(flex: 2),

            // Horizontal mockup container
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First phone mockup
                  _buildPhoneMockup(mockupWidth, mockupHeight, 'assets/app_mock_1.png'),

                  // Space between mockups
                  SizedBox(width: screenWidth * 0.05),

                  // Second phone mockup
                  _buildPhoneMockup(mockupWidth, mockupHeight, 'assets/app_mock_2.png'),
                ],
              ),
            ),

            // Space after mockups
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  // Helper method to build phone mockup
  Widget _buildPhoneMockup(double width, double height, String imagePath) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Phone frame
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE777F5).withOpacity(0.15),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
        ),

        // Screenshot image
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: width * 0.95,
            height: height * 0.95,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Animated glow effect
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: width * 0.5,
            height: width * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xffE777F5).withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
