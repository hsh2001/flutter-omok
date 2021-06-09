import 'dart:math';

import 'package:flutter/material.dart';

final int boardSize = 15;

enum StoneColor {
  none,
  black,
  white,
}

Color stoneColorToColor(StoneColor stoneColor) {
  switch (stoneColor) {
    case StoneColor.black:
      return Colors.black;

    case StoneColor.white:
      return Colors.white;

    default:
      return Colors.transparent;
  }
}

class Stone extends StatelessWidget {
  final StoneColor stoneColor;

  Stone({
    @required this.stoneColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(9999)),
          color: stoneColorToColor(stoneColor),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int x;
  final int y;
  final StoneColor stoneColor;

  Box({
    @required this.x,
    @required this.y,
    @required this.stoneColor,
  }) : super();

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: Colors.amber[100],
      border: Border.all(width: 0.5),
    );

    final windowSize = MediaQuery.of(context).size;
    final double boxSize = min(windowSize.width, windowSize.height) / 16;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: boxDecoration,
        width: boxSize,
        height: boxSize,
        child: Stone(stoneColor: stoneColor),
      ),
    );
  }
}

class Board extends StatelessWidget {
  List<Widget> _rows(int y) {
    return List<Widget>.generate(
      boardSize,
      (x) => Box(
        x: x,
        y: y,
        stoneColor: StoneColor.white,
      ),
    );
  }

  Widget _buildRow(int y) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _rows(y),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(boardSize, _buildRow),
    );
  }
}
