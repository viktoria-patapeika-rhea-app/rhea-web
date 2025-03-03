import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 64.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final circleSize = screenWidth < 900 ? screenWidth * 0.25 : screenWidth * 0.3;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity, // Ensure it takes full width
        child: Stack(
          fit: StackFit.expand, // Make the stack expand to fill available space
          children: [
            // Circle Chart in the top right
            Positioned(
              top: 100,
              right: 50,
              child: CustomPaint(
                size: Size(circleSize, circleSize),
                painter: CircleDiagramPainter(),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 3),
                  // Title
                  Text(
                    'BREAKING BARRIERS IN\nWOMEN\'S FITNESS',
                    style: GoogleFonts.orbitron(
                      fontSize: titleFontSize,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(flex: 2),
                  // Statistics
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• 85% of women feel that fitness apps don\'t cater to their unique needs.',
                        style: GoogleFonts.exo2(
                          fontSize: descriptionFontSize,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '• 80% of exercise research still focuses on men.',
                        style: GoogleFonts.exo2(
                          fontSize: descriptionFontSize,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.76;
    final center = size.center(Offset.zero);

    // Box shadow
    final shadowPaint = Paint()
      ..color = Color(0xFF5E6DEA).withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 32);
    canvas.drawCircle(center, outerRadius, shadowPaint);

    // Additional outer box shadow
    final outerShadowPaint = Paint()
      ..color = Color(0xFF5E6DEA).withOpacity(0.05)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 32);
    canvas.drawCircle(center, outerRadius + 5, outerShadowPaint);

    // Outer circle border with gradient
    final outerStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = SweepGradient(
        colors: [
          Color(0xFFE777F5),
          Color(0xFF4869FF),
          Color(0xFFE777F5),
        ],
        startAngle: 0,
        endAngle: math.pi * 2,
      ).createShader(Rect.fromCircle(center: center, radius: outerRadius));

    canvas.drawCircle(center, outerRadius, outerStrokePaint);

    // Inner circle border with gradient
    final innerStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = SweepGradient(
        colors: [
          Color(0xFFE777F5),
          Color(0xFF4869FF),
          Color(0xFFE777F5),
        ],
        startAngle: 0,
        endAngle: math.pi * 2,
      ).createShader(Rect.fromCircle(center: center, radius: innerRadius));

    canvas.drawCircle(center, innerRadius, innerStrokePaint);

    // Inner shadow
    final innerShadowPaint = Paint()
      ..color = Color(0xFF5E6DEA).withOpacity(0.05)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 32);
    canvas.drawCircle(center, innerRadius, innerShadowPaint);

    // Filled part (20%) between inner and outer circles
    final filledPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = SweepGradient(
        colors: [
          Color(0xFFE777F5),
          Color(0xFF4869FF),
          Color(0xFFE777F5),
        ],
        startAngle: 0,
        endAngle: math.pi * 2,
      ).createShader(Rect.fromCircle(center: center, radius: outerRadius));

    // Save canvas state
    canvas.save();

    // Create path for the ring (between outer and inner circles)
    final path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: outerRadius))
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius))
      ..fillType = PathFillType.evenOdd;

    // Clip to the ring area
    canvas.clipPath(path);

    // Draw the 20% filled arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      -math.pi / 2, // Start at the top
      math.pi * 2 * 0.2, // 20% of the full circle
      true,
      filledPaint,
    );

    // Restore canvas state
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
