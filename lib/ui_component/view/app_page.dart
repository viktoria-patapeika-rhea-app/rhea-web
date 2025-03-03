import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhea_ai_website/blocs/app_bar_bloc/footer_bloc.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/beta_subscription.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/pitch_scroll.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_footer.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
//  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jumpKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double horizontalPadding = deviceSize.width > 720 ? 96 : 26;
    return Scaffold(
      backgroundColor: Color(0xff212554),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/gradient.png'), fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 44, horizontal: horizontalPadding),
              child: Column(
                children: [
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.height,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: List.generate(4, (i) => _buildCircle(i == 0 || i == 2))),
                              SizedBox(height: 12),
                              Row(children: List.generate(3, (i) => _buildCircle(i == 1))),
                              SizedBox(height: 12),
                              Row(children: List.generate(2, (i) => _buildCircle(i == 0))),
                              SizedBox(height: 12),
                              Row(children: [_buildCircle(true)]),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(children: [_buildCircle(false)]),
                              SizedBox(height: 12),
                              Row(children: List.generate(2, (i) => _buildCircle(i == 1))),
                              SizedBox(height: 12),
                              Row(children: List.generate(3, (i) => _buildCircle(i == 1))),
                              SizedBox(height: 12),
                              Row(children: List.generate(4, (i) => _buildCircle(i == 1 || i == 3))),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SizedBox(
                           // height: 108,
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('MEET',
                                  style: GoogleFonts.exo2(
                                      color: Color(0xffCFCFCF), fontSize: 28, fontWeight: FontWeight.w200)),
                              Text('RHEA',
                                  style: GoogleFonts.orbitron(
                                      color: Colors.white, fontSize: 64, fontWeight: FontWeight.w400)),
                            ],
                          )),
                        ),
                        CenterPiece(),
                        Positioned(
                          left: 0,
                          bottom: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'In Greek mythology,\n'
                                'Rhea is the goddess\n'
                                "of flow and life's rhythm.",
                                style: GoogleFonts.orbitron(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'She symbolizes the cycles\n'
                                'of nature and the power of transformation.\n'
                                'At Rhea, we carry her legacy forward—blending\n'
                                'technology and science to align your fitness journey\n'
                                "with your body's natural rhythm.",
                                style: GoogleFonts.orbitron(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 64), child: BetaSubscription()),
                 
                  PitchScroll(),
                  RheaWebFooter(
                    onEmailSubmit: () {},
                    onPageNavigation: (namedRoute) {
                      context.read<RheaWebFooterBloc>().add(PageTapped(namedRoute: namedRoute));

                      debugPrint('tapped ${namedRoute.toString()}');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(bool isTransparent) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xffE777F5).withOpacity(isTransparent ? 0.6 : 1.0),
              Color(0xff0D1B3C).withOpacity(0),
            ],
            stops: [0.2, 1.0],
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class GrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final random = Random();

    for (int i = 0; i < 5000; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final opacity = random.nextDouble() * 0.1; // Control grain visibility

      paint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(dx, dy), 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CenterPiece extends StatefulWidget {
  // Base measurements and ratios
  static const double phoneWidthRatio = 0.8; // 60% of width for phones
  static const double otherHeightRatio = 0.7; // 67% of height for other devices
  static const double baseCircleSize = 558.0;
  static const double baseOffsetY = -44.0;
  static const double phoneBreakpoint = 600.0; // Standard phone width breakpoint

  @override
  State<CenterPiece> createState() => _CenterPieceState();
}

class _CenterPieceState extends State<CenterPiece> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Adjust speed as needed
      vsync: this,
    )..repeat(); // Makes the animation continuous
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    // Determine if we're on a phone
    final bool isPhone = deviceSize.width < CenterPiece.phoneBreakpoint;

    // Calculate target size based on device type
    final double targetSize =
        isPhone ? deviceSize.width * CenterPiece.phoneWidthRatio : deviceSize.height * CenterPiece.otherHeightRatio;

    // Calculate coefficient based on how much we need to scale from base size
    final double coefficient = targetSize / CenterPiece.baseCircleSize;

    // Calculate responsive measurements
    final double circleSize = CenterPiece.baseCircleSize * coefficient;
    final double offsetY = CenterPiece.baseOffsetY * coefficient;
    final double imageHeight = !isPhone ? circleSize - 32 : circleSize - 24;

    return Center(
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Original static circle
            Transform.translate(
              offset: Offset(0, offsetY),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffE777F5),
                    width: 3,
                  ),
                ),
              ),
            ),

            // First animated circle
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    12 * cos(_controller.value * 2 * pi),
                    offsetY + 12 * sin(_controller.value * 2 * pi),
                  ),
                  child: Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5).withOpacity(0.7),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Second animated circle with phase offset
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    14 * cos((_controller.value * 2 * pi) + pi / 2), // Phase offset of π/2 (90 degrees)
                    offsetY + 14 * sin((_controller.value * 2 * pi) + pi / 2), // Phase offset of π/2 (90 degrees)
                  ),
                  child: Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5).withOpacity(0.5), // Even more transparent
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    10 * cos((_controller.value * 2 * pi) + pi / 3), // Phase offset of π/2 (90 degrees)
                    offsetY + 10 * sin((_controller.value * 2 * pi) + pi / 3), // Phase offset of π/2 (90 degrees)
                  ),
                  child: Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE777F5).withOpacity(0.3), // Even more transparent
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Woman SVG
            Container(
              height: imageHeight,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/woman.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
