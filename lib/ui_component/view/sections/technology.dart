import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnologyPage extends StatefulWidget {
  @override
  _TechnologyPageState createState() => _TechnologyPageState();
}

class _TechnologyPageState extends State<TechnologyPage> {
  List<String> binaryLines = List.generate(15, (_) => '');
  List<double> topPaddings = List.generate(15, (_) => 0.0);
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _generateBinaryLines();
    Timer.periodic(Duration(milliseconds: 600), (timer) {
      _generateBinaryLines();
    });
  }

  void _generateBinaryLines() {
    setState(() {
      binaryLines = List.generate(26, (_) {
        return List.generate(20, (index) => (index % 2 == 0) ? '0' : '1').join('\n');
      });
      topPaddings = List.generate(26, (_) => random.nextDouble() * 200);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth < 900 ? 36.0 : 58.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final binaryFontSize = screenWidth < 900 ? 12.0 : 14.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Binary Background
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(binaryLines.length, (index) {
                  return Flexible(
                    child: Container(
                      padding: EdgeInsets.only(top: topPaddings[index]),
                      alignment: Alignment.topCenter,
                      child: Text(
                        binaryLines[index],
                        style: GoogleFonts.exo2(
                          fontSize: binaryFontSize,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffcfcfcf).withOpacity(0.2),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 1),
                // Page Number

                Spacer(flex: 2),
                // Title
                Text(
                  'TECHNOLOGY\nBEHIND\nRHEA',
                  style: GoogleFonts.orbitron(
                    fontSize: titleFontSize,
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 2),
                // Description
                Text(
                  'Powered by cutting-edge AI, Rhea dynamically adapts to your unique hormonal data and fitness goals in real-time.\n\n'
                  'By combining advanced algorithms and actionable insights, Rhea provides tailored plans that evolve with you.',
                  style: GoogleFonts.exo2(
                    fontSize: descriptionFontSize,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                Spacer(flex: 3),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
