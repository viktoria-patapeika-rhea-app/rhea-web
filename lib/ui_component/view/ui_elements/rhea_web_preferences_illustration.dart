import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebPreferencesIllustration extends StatefulWidget {
  const RheaWebPreferencesIllustration({super.key, required this.maxSize});
  final double maxSize;

  @override
  State<RheaWebPreferencesIllustration> createState() => _RheaWebPreferencesIllustrationState();
}

class _RheaWebPreferencesIllustrationState extends State<RheaWebPreferencesIllustration>
    with SingleTickerProviderStateMixin {
  final List<String> _preferences = RheaWebText.landingPageFlowPreferencesList;
  List<Color> _colors = [
    RheaWebColor.semanticGreenColor,
    RheaWebColor.semanticPinkColor,
    RheaWebColor.semanticRedColor,
    RheaWebColor.semanticWhiteColor,
    RheaWebColor.cardBackgroundColor,
  ];
  List<Gradient> _gradients = [
    RadialGradient(
        colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticGreenColor], radius: 0.6),
    RadialGradient(colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticRedColor], radius: 0.6),
    RadialGradient(
        colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticGreenColor], radius: 0.6),
    RadialGradient(colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticRedColor], radius: 0.6),
    RadialGradient(
        colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticGreenColor], radius: 0.6),
    RadialGradient(
        colors: [RheaWebColor.backgroundColor.withOpacity(0.6), RheaWebColor.semanticWhiteColor], radius: 0.6),
  ];

  late AnimationController _controller;
  late List<_Bubble> _bubbles;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
    _initializeBubbles();
  }

  void _initializeBubbles() {
    _bubbles = List.generate(8, (index) => _createBubble());
  }

  _Bubble _createBubble() {
    double size = Random().nextDouble() * 50 + 50;
    double xPosition = Random().nextDouble() * (widget.maxSize - size);
    double yPosition = Random().nextDouble() * (widget.maxSize - size);
    double dx = Random().nextBool() ? 1 : -1;
    double dy = Random().nextBool() ? 1 : -1;

    return _Bubble(
      size: size,
      xPosition: xPosition,
      yPosition: yPosition,
      dx: dx,
      dy: dy,
      gradient: _gradients[Random().nextInt(_gradients.length)],
      text: _preferences[Random().nextInt(_preferences.length)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.maxSize,
      height: widget.maxSize,
      child: Stack(
        children: _bubbles.map((bubble) {
          _moveBubble(bubble);
          return Positioned(
            left: bubble.xPosition,
            top: bubble.yPosition,
            child: Container(
              width: bubble.size,
              height: bubble.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: bubble.gradient,
              ),
              child: Center(
                child: Text(
                  bubble.text,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: bubble.size / 8),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _moveBubble(_Bubble bubble) {
    bubble.xPosition += bubble.dx;
    bubble.yPosition += bubble.dy;

    if (bubble.xPosition <= 0 || bubble.xPosition + bubble.size >= widget.maxSize) {
      bubble.dx *= -1;
    }
    if (bubble.yPosition <= 0 || bubble.yPosition + bubble.size >= widget.maxSize) {
      bubble.dy *= -1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Bubble {
  double size;
  double xPosition;
  double yPosition;
  double dx;
  double dy;
  final String text;
  Gradient gradient;

  _Bubble({
    required this.size,
    required this.xPosition,
    required this.yPosition,
    required this.dx,
    required this.dy,
    required this.text,
    required this.gradient,
  });
}

class _BubbleWidget extends StatelessWidget {
  final _Bubble bubble;

  const _BubbleWidget({required this.bubble});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bubble.size,
      height: bubble.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: bubble.gradient,
      ),
      child: Center(
        child: Text(
          bubble.text,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: bubble.size / 8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
