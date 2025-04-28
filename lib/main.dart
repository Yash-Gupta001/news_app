import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/pages/homepage/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const Homepage(),
    );
  }
}
