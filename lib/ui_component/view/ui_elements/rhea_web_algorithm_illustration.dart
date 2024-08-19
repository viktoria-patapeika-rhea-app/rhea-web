import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class AlgorithmIllustration extends StatefulWidget {
  const AlgorithmIllustration({super.key, required this.maxSize});
  final double maxSize;

  @override
  State<AlgorithmIllustration> createState() => _AlgorithmIllustrationState();
}

class _AlgorithmIllustrationState extends State<AlgorithmIllustration> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0.0);
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double firstRingSize = widget.maxSize;
    double secondRingSize = widget.maxSize * .85;
    double thirdRingSize = widget.maxSize * .36;
    double coreSize = widget.maxSize * .31;
    Color baseColor = RheaWebColor.cardBackgroundColor;
    Color accentColor = RheaWebColor.semanticGreenColor;
    return SizedBox(
      width: widget.maxSize,
      height: widget.maxSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Container(
                    width: firstRingSize,
                    height: firstRingSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: baseColor,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [accentColor, baseColor, baseColor, baseColor,baseColor, baseColor, baseColor],
                      ),
                    ),
                    child: Center(
                      child: Container(
                          width: firstRingSize - 8,
                          height: firstRingSize - 8,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: RheaWebColor.backgroundColor)),
                    ),
                  ),
                );
              }),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Container(
                    width: secondRingSize,
                    height: secondRingSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: baseColor,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [accentColor, baseColor, baseColor, baseColor, baseColor],
                      ),
                    ),
                    child: Center(
                      child: Container(
                          width: secondRingSize - 8,
                          height: secondRingSize - 8,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: RheaWebColor.backgroundColor)),
                    ),
                  ),
                );
              }),
          Container(
            width: thirdRingSize,
            height: thirdRingSize,
            decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor),
            child: Center(
              child: Container(
                  width: thirdRingSize - 8,
                  height: thirdRingSize - 8,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: RheaWebColor.backgroundColor)),
            ),
          ),
          Container(
            width: coreSize,
            height: coreSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [accentColor, accentColor, RheaWebColor.backgroundColor],
                stops: [0.5, 0.65, 0.9],
                center: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularGradientPainter extends CustomPainter {
  final double progress;
  final List<Color> colors;
  final double strokeWidth;
  CircularGradientPainter({required this.progress, required this.colors, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    final gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * pi,
      colors: colors,
      stops: [progress, progress, 1.0],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CircularGradientPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
