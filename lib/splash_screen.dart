import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'main.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _growController;
  late AnimationController _swayController;

  @override
  void initState() {
    super.initState();

    // Grow animation (scale up)
    _growController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // Once grown, start swaying like wind
    _swayController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Navigate to home after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginPage()) );
    });
  }

  @override
  void dispose() {
    _growController.dispose();
    _swayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.2, end: 1.0).animate(
            CurvedAnimation(parent: _growController, curve: Curves.easeOutBack),
          ),
          child: AnimatedBuilder(
            animation: _swayController,
            builder: (context, child) {
              double sway = math.sin(_swayController.value * math.pi) * 0.03; // gentle tilt
              return Transform.rotate(
                angle: sway,
                child: child,
              );
            },
            child: Image.asset(
             'assets/logo.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
