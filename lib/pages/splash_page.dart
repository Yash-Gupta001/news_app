import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/controller/auth_controller.dart';
import 'package:news_app/pages/auth/login_page.dart';
import 'package:news_app/homepage_controller.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});
  final AuthController authController = Get.put(AuthController());

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

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    // Wait for animation
    Timer(const Duration(milliseconds: 1300), () async {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User is signed in
        Get.off(() => const HomepageController());
      } else {
        // User is not signed in
        Get.off(() => LoginPage());
      }
    });
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _opacity,
            child: Image.asset(
              'Assets/icon.png',
              width: 180.w,
              height: 180.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
