import 'package:flutter/material.dart';
import 'package:news_app/components/back_appbar.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(
        title: 'Profile',
      ),
      body: const Column(
        children: [
          Center(child: Text("Profile page"))
        ],
      ),
    );
  }
}