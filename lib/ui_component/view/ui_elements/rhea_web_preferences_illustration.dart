import 'dart:math';

import 'package:flutter/material.dart';
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
  final int gridSize = 10;
  late AnimationController _controller;
  late List<_TetrisWordBlock> _blocks;
  late List<Offset> _occupiedPositions;

  @override
  void initState() {
    super.initState();

    _blocks = [];
    _occupiedPositions = [];
    _initializeBlocks();

    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          if (_controller.value == 1.0) {
            _initializeBlocks();
            _controller.reset();
          }
        });
      })
      ..repeat();

    // _controller.addListener(() {
    //   setState(() {});
    // });

    // _controller.forward();
  }

  void _initializeBlocks() {
    double cellSize = widget.maxSize / gridSize;
    int startY = 0;

    for (String word in _preferences) {
      int startX = Random().nextInt(gridSize - word.length);
      List<Offset> wordPositions = [];

      for (int i = 0; i < word.length; i++) {
        Offset position = Offset((startX + i).toDouble(), startY.toDouble());
        if (!_occupiedPositions.contains(position)) {
          wordPositions.add(position);
        }
      }

      if (wordPositions.length == word.length) {
        _TetrisWordBlock block = _TetrisWordBlock(
          word: word,
          color: _colors[Random().nextInt(_colors.length)],
          positions: wordPositions,
          size: cellSize,
        );

        _blocks.add(block);
        _occupiedPositions.addAll(wordPositions);
      } else {
        debugPrint("Skipping word $word due to overlap");
      }
      startY++;
      if (startY >= gridSize) startY = 0;
    }
    debugPrint("Blocks initialized: ${_blocks.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.maxSize,
      height: widget.maxSize,
      color: RheaWebColor.cardBackgroundColor,
      child: Stack(
        children: _blocks.map((block) {
          return AnimatedPositioned(
            left: block.positions.first.dx * block.size,
            top: block.positions.first.dy * block.size + (_controller.value * widget.maxSize) - widget.maxSize,
            onEnd: () {
              setState(() {
                block.locked = true;
              });
            },
            child: block.locked
                ? _TetrisWord(block: block)
                : Transform.rotate(
                    angle: 0.0,
                    child: _TetrisWord(block: block),
                  ),
            duration: Duration(milliseconds: 500),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TetrisWord extends StatelessWidget {
  final _TetrisWordBlock block;

  _TetrisWord({required this.block});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: block.positions.map((position) {
        return Positioned(
          left: (position.dx - block.positions.first.dx) * block.size,
          top: (position.dy - block.positions.first.dy) * block.size,
          child: Container(
            width: block.size,
            height: block.size,
            color: block.color,
            child: Center(
              child: Text(
                block.word[block.positions.indexOf(position)],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: block.size / 2,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _TetrisWordBlock {
  final String word;
  final Color color;
  final List<Offset> positions;
  final double size;
  bool locked = false;

  _TetrisWordBlock({required this.word, required this.color, required this.positions, required this.size});
}
