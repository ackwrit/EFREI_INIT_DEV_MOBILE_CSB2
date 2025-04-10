import 'dart:async';

import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  int timer;
  Widget child;
  MyAnimation({super.key, required this.child, required this.timer});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animationOffset;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    );
    animationOffset = Tween(
      begin: Offset(1, 1),
      end: Offset.zero,
    ).animate(curvedAnimation);
    Timer(Duration(seconds: widget.timer), () {
      controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: SlideTransition(position: animationOffset, child: widget.child),
    );
  }
}
