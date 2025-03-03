import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoadmapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 58.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final pointsFontSize = screenWidth < 900 ? 12.0 : 16.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 4),
            // Title
            Text(
              'THE ROAD\nAHEAD',
              style: GoogleFonts.orbitron(
                fontSize: titleFontSize,
                color: Colors.white,
              ),
            ),
            Spacer(flex: 2),
            // Description
            Text(
              'At Rhea, every step we take brings us closer to revolutionizing women\'s health and fitness.\n\n'
              'Here\'s a glimpse at our progress and where we\'re headed.',
              style: GoogleFonts.exo2(
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            Spacer(flex: 2),
            // Roadmap
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRoadmapPoint(null, 'R&D', true),
                _buildConnectingLine(),
                _buildRoadmapPoint(null, 'Development', true),
                _buildConnectingLine(),
                _buildRoadmapPoint('May 2024', 'G-Accelerator\nBarcelona, Spain', true),
                _buildConnectingLine(),
                _buildRoadmapPoint('Dec 2024', '20 Best\nAccelerator Startups\nCatalunya, Spain', true),
                _buildConnectingLine(),
                _buildRoadmapPoint('2025', 'MVP launch', false),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildRoadmapPoint(String? date, String description, bool isDone) {
    return Builder(builder: (context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final pointsFontSize = screenWidth < 900 ? 12.0 : 16.0;

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (date != null) ...[
            Text(
              date,
              style: GoogleFonts.exo2(
                fontSize: pointsFontSize,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
          ] else ...[
            SizedBox(height: pointsFontSize),
            SizedBox(height: 16),
          ],
          Container(
            width: screenWidth < 900 ? 8 : 12,
            height: screenWidth < 900 ? 8 : 12,
            decoration: BoxDecoration(
              color: isDone ? Color(0xFFE777F5) : Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.exo2(
              fontSize: pointsFontSize,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildConnectingLine() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        height: 1,
        color: Color(0xFFCFCFCF).withOpacity(0.7),
      ),
    );
  }
}
