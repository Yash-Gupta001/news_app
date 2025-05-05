import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:news_app/pages/auth/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for fade-in effect
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the fade-in animation
    _controller.forward();

    // Navigate after 1.3 seconds
    Timer(const Duration(milliseconds: 1300), () {
      Get.off(() => LoginPage());
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _opacity,
            child: Image.asset(
              'Assets/icon.png',
              width: 180, // Adjust size as needed
              height: 180, // Adjust size as needed
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
