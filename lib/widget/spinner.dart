import 'dart:math';

import 'package:flutter/material.dart';

/*
class SpinningCircle extends StatefulWidget {
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;

  const SpinningCircle({
    Key? key,
    this.strokeWidth = 4.0,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
  }) : super(key: key);

  @override
  _SpinningCircleState createState() => _SpinningCircleState();
}

class _SpinningCircleState extends State<SpinningCircle> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi)
        .animate(_controller)
      ..addListener(() => setState(() {}));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: _CirclePainter(
            strokeWidth: widget.strokeWidth,
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            animationValue: _rotationAnimation.value,
          ),
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final double animationValue;

  _CirclePainter({
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    canvas.drawCircle(center, radius, paint);

    paint.color = foregroundColor;
    final arcRect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(arcRect, animationValue, 0.75 * pi, true, paint);
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => oldDelegate.animationValue != animationValue;
}
*/
