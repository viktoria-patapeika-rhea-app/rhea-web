import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebHealthMetricsIllustration extends StatefulWidget {
  const RheaWebHealthMetricsIllustration({super.key, required this.maxSize});
  final double maxSize;

  @override
  State<RheaWebHealthMetricsIllustration> createState() => _RheaWebHealthMetricsIllustrationState();
}

class _RheaWebHealthMetricsIllustrationState extends State<RheaWebHealthMetricsIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _circleAnimation1;
  late Animation<Color?> _circleAnimation2;
  late Animation<Color?> _circleAnimation3;
  late Animation<Color?> _circleAnimation4;
  late Animation<Color?> _circleAnimation5;
  late Animation<Color?> _circleAnimation6;
  late Animation<double> _lineAnimation1;
  late Animation<double> _lineAnimation2;
  late Animation<double> _lineAnimation3;
  late Animation<double> _lineAnimation4;
  late Animation<double> _lineAnimation5;

  final Color baseColor = RheaWebColor.cardBackgroundColor;
  final Color accentColor = RheaWebColor.semanticGreenColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 8))..repeat(reverse: true);

    _circleAnimation1 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.easeIn)),
    );
    // _lineAnimation1 = ColorTween(begin: baseColor, end: accentColor).animate(
    //   CurvedAnimation(parent: _controller, curve: Interval(0.1, 0.15, curve: Curves.easeIn)),
    // );
    _lineAnimation1 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.1, 0.15, curve: Curves.easeIn)));
    _circleAnimation2 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.15, 0.25)),
    );

    _lineAnimation2 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.25, 0.3, curve: Curves.easeIn)));

    _circleAnimation3 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.4, curve: Curves.easeIn)),
    );

    _lineAnimation3 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.45, 0.5, curve: Curves.easeIn)));

    _circleAnimation4 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 0.6, curve: Curves.easeIn)),
    );

    _lineAnimation4 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.6, 0.65, curve: Curves.easeIn)));

    _circleAnimation5 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.65, 0.75)),
    );

    _lineAnimation5 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.75, 0.8, curve: Curves.easeIn)));

    _circleAnimation6 = ColorTween(begin: baseColor, end: accentColor).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.8, 0.9)),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation3),
                  AnimatedBuilder(
                      animation: _lineAnimation2,
                      builder: (context, child) {
                        return Container(
                          width: (widget.maxSize - 120) / 2,
                          height: 6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [accentColor, baseColor],
                            stops: [_lineAnimation2.value, 0.0],
                          )),
                        );
                      }),
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation2),
                  AnimatedBuilder(
                      animation: _lineAnimation1,
                      builder: (context, child) {
                        return Container(
                          width: (widget.maxSize - 120) / 2,
                          height: 6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [accentColor, baseColor],
                            stops: [_lineAnimation1.value, 0.0],
                          )),
                        );
                      }),
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation1),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: AnimatedBuilder(
                      animation: _lineAnimation3,
                      builder: (context, child) {
                        return Container(
                          width: 6,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [accentColor, baseColor],
                            stops: [_lineAnimation3.value, 0.0],
                          )),
                        );
                      }),
                ),
                Row(children: [
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation4),
                  AnimatedBuilder(
                      animation: _lineAnimation4,
                      builder: (context, child) {
                        return Container(
                          width: (widget.maxSize - 120) / 2,
                          height: 6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [accentColor, baseColor],
                            stops: [_lineAnimation4.value, 0.0],
                          )),
                        );
                      }),
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation5),
                  AnimatedBuilder(
                      animation: _lineAnimation5,
                      builder: (context, child) {
                        return Container(
                          width: (widget.maxSize - 120) / 2,
                          height: 6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [accentColor, baseColor],
                            stops: [_lineAnimation5.value, 0.0],
                          )),
                        );
                      }),
                  _HealthMetricsIllustrationCircle(circleAnimation: _circleAnimation6),
                ]),
              ]);
        });
  }
}

class _HealthMetricsIllustrationCircle extends StatelessWidget {
  const _HealthMetricsIllustrationCircle({
    super.key,
    required Animation<Color?> circleAnimation,
  }) : _circleAnimation = circleAnimation;

  final Animation<Color?> _circleAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: _circleAnimation.value),
      ),
      if (_circleAnimation.value == RheaWebColor.semanticGreenColor)
        SvgPicture.asset(RheaWebText.iconPathCheckSolo, height: 12, width: 16),
    ]);
  }
}
