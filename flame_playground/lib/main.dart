import 'package:flame/game.dart';
import 'package:flame_playground/desk.dart';
import 'package:flutter/material.dart';

import 'grid_map.dart';

Vector2 deskVector2({int wide = 1, int tall = 1, required double cellSize}) {
  return Vector2(
    cellSize * wide,
    cellSize * tall,
  );
}

const double cellSize = 50.0;

class MyGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.white;

  @override
  Future<void> onLoad() async {
    final gridMap = GridMap();
    add(gridMap);

    final desk = Desk(
      cellSize: cellSize,
      position: Vector2(100, 100),
      size: deskVector2(wide: 2, tall: 1, cellSize: cellSize),
    );
    add(desk);
  }
}

void main() {
  final game = MyGame();
  runApp(GameWidget<MyGame>(game: game));
}
