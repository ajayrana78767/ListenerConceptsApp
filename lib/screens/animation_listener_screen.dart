// Animation Listener Screen
import 'package:flutter/material.dart';

class AnimationListenerScreen extends StatefulWidget {
  @override
  _AnimationListenerScreenState createState() =>
      _AnimationListenerScreenState();
}

class _AnimationListenerScreenState extends State<AnimationListenerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        if (animationController.value > 0.5) {
          debugPrint('Animation is halfway: ${animationController.value}');
        }
      });
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Listener')),
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: animationController.value,
              child: child,
            );
          },
          child: Container(width: 100, height: 100, color: Colors.blue),
        ),
      ),
    );
  }
}
