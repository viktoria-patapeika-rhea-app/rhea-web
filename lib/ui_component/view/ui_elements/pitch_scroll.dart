import 'dart:async';
import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' show pi;
import 'package:http/http.dart' as http;

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import '../sections/flow_explained.dart';
import '../sections/mission.dart';
import '../sections/features.dart';
import '../sections/statistics.dart';
import '../sections/technology.dart';
import '../sections/roadmap.dart';
import '../sections/to_add.dart';
import 'package:flutter/services.dart';

class PitchScroll extends StatefulWidget {
  const PitchScroll({super.key});

  @override
  State<PitchScroll> createState() => _PitchScrollState();
}

class _PitchScrollState extends State<PitchScroll> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Widget> _pages = [
    FlowExplained(),
    Mission(),
    Features(),
   /* Statistics(),
    Technology(),
    Roadmap(),
    ToAdd(),*/
  ];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft && currentPage > 0) {
            currentPage--;
            _pageController.animateToPage(
              currentPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            setState(() {});
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight && currentPage < 6) {
            currentPage++;
            _pageController.animateToPage(
              currentPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            setState(() {});
          }
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            
            SizedBox(
              width: deviceSize.width,
              height: deviceSize.height,
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                physics: const AlwaysScrollableScrollPhysics(),
                children: _pages,
              ),
            ),
            Positioned(
              left: 0,
              top: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.0, 0.5),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      '${(currentPage + 1).toString().padLeft(2, '0')}',
                      key: ValueKey<int>(currentPage),
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: currentPage+1!=1? Offset(96, -24): Offset(80,-24), 
                    child: Text(
                      // '/ 07',
                      '/ 03',
                      style: GoogleFonts.orbitron(
                        color: Color(0xffCFCFCF),
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 32,
              top: deviceSize.height / 2 - 80,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0 && currentPage > 0) {
                    // Scrolling right (previous page)
                    currentPage--;
                    _pageController.animateToPage(
                      currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {});
                  } else if (details.primaryVelocity! < 0 && currentPage < 6) {
                    // Scrolling left (next page)
                    currentPage++;
                    _pageController.animateToPage(
                      currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {});
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'scroll',
                      style: GoogleFonts.exo2(color: Color(0xffcfcfcf).withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w200),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        color: Color(0xffcfcfcf).withOpacity(0.7),
                        width: 55,
                        height: 1,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(color: Color(0xffE777F5), shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
