import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Desk extends PositionComponent with DragCallbacks {
  final double cellSize;

  Desk({
    required this.cellSize,
    Vector2? position,
    Vector2? size,
  }) : super(
          position: position,
          size: size ?? Vector2.all(cellSize),
          anchor: Anchor.center,
        );

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    _snapToGrid();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.add(event.localDelta);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), Paint()..color = Colors.blue);
  }

  void _snapToGrid() {
    double newX = ((position.x + (size.x / 2)) / cellSize).round() * cellSize -
        (size.x / 2);
    double newY = ((position.y + (size.y / 2)) / cellSize).round() * cellSize -
        (size.y / 2);
    position = Vector2(newX, newY);
  }
}
