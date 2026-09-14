import 'package:animation/features/tween_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterAdvancedAnimations());
}

class FlutterAdvancedAnimations extends StatelessWidget {
  const FlutterAdvancedAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TweenAnimation(),
    );
  }
}
