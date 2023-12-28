import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GridMap extends PositionComponent {
  static const int gridSize = 20;
  static const double cellSize = 50.0;
  late final Paint _paint;

  GridMap() {
    _paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    size = Vector2(gridSize * cellSize, gridSize * cellSize);
  }

  @override
  void render(Canvas canvas) {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        canvas.drawRect(
          Rect.fromLTWH(j * cellSize, i * cellSize, cellSize, cellSize),
          _paint,
        );
      }
    }
  }
}
