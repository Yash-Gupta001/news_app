import 'package:flutter/material.dart';
import 'package:news_app/pages/login/login_page.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1300), () {
      Get.off(() => LoginPage()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'Assets/icon.png',
          width: 120,
        ),
      ),
    );
  }
}
