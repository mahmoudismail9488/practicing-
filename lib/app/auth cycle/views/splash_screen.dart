import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    // scale animation for rawmart image
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controller.forward();
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    );
    // fade for rawmart

    _controller.forward();
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // timer to splash screen and navigate to onboarding screen
    timer = Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset("assets/imgs/logo.png", width: 107),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset("assets/imgs/rawmart.png", width: 107),
            ),
          ],
        ),
      ),
    );
  }
}
