import 'package:flutter/material.dart';

class MyCustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.33);
    path.cubicTo(
      size.width * 0.33,
      size.height * 0.5,
      size.width * 0.66,
      size.height * 0.30,
      size.width,
      size.height * 0.33,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
