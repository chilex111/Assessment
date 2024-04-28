import 'dart:math';
import 'package:flutter/material.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationValue = 0.0; // Initial rotation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Adjust animation duration
    )..repeat(); // Continuously repeat the animation

    _controller.addListener(() {
      setState(() {
        _rotationValue = _controller.value * 2 * pi; // Update rotation value
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: // This code assumes it's placed within a larger widget structure

// Frame 175
        Column(
          children: [
          ],
        ),

    );
  }
}
