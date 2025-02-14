import 'package:flutter/material.dart';

class BgBubbleDiv extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double height;
  final double opacity;

  const BgBubbleDiv({
    super.key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: 45 * 3.14159 / 180,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white.withOpacity(opacity),
          ),
        ),
      ),
    );
  }
}
