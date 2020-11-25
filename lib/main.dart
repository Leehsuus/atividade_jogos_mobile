import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/time.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flame/components/component.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/sprite.dart';
import 'package:flame/components/joystick/joystick_component.dart';

class BallComponent extends PositionComponent {
  BallComponent(this._screenSize) {
    y = width = height = 50;
  }
  @override
  void update(double dt) {
    x += 300 * dt * _direction;

    if (( x <= 0 && _direction == -1) ||
        (x + width >= _screenSize.width && _direction == 1))
      _direction = _direction * -1;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawOval(toRect(),_paint);
  }
}

class BallGame extends BaseGame {
  BallGame(Size screenSize) {
    size = screenSize;
    add(BallComponent(size));
  }
}