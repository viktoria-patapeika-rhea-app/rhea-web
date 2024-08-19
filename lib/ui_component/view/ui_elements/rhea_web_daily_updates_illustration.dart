import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:flutter_svg/flutter_svg.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class DailyUpdatesIllustration extends StatefulWidget {
  const DailyUpdatesIllustration({super.key, required this.maxSize});
  final double maxSize;

  @override
  State<DailyUpdatesIllustration> createState() => _DailyUpdatesIllustrationState();
}

class _DailyUpdatesIllustrationState extends State<DailyUpdatesIllustration> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: widget.maxSize - 24).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color baseColor = RheaWebColor.cardBackgroundColor;
    final Color activityAccentColor = RheaWebColor.semanticGreenColor;
    final Color flowAccentColor = RheaWebColor.semanticRedColor;
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: widget.maxSize, child: _buildAnimation(activityAccentColor, baseColor, RheaWebText.iconPathTreadmill)),
      Padding(
        padding: const EdgeInsets.only(top: 48),
        child: SizedBox(
            width: widget.maxSize, child: _buildAnimation(flowAccentColor, baseColor, RheaWebText.iconPathDrop)),
      ),
    ]);
  }

  Stack _buildAnimation(Color accentColor, Color baseColor, String icon) {
    return Stack(children: [
      AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              top: 5,
              left: 24,
              child: Container(
                width: widget.maxSize - 24,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(72)),
                    gradient: LinearGradient(
                      colors: [
                        accentColor,
                        accentColor,
                        baseColor,
                        baseColor,
                      ],
                      stops: [
                        0.0,
                        _animation.value / widget.maxSize - 0.1,
                        _animation.value / widget.maxSize + 0.1,
                        1.0
                      ],
                    )),
              ),
            );
          }),
      AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: baseColor, boxShadow: [
                  BoxShadow(color: accentColor.withOpacity(0.25), offset: Offset(4, 4), blurRadius: 8),
                ]),
                width: 48,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(icon),
                ),
              ),
            );
          }),
    ]);
  }
}
