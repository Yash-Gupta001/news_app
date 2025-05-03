import 'package:flutter/material.dart';
import 'package:news_app/components/custom_appbar.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Login",
      ),
      body: Center(
        child: Text('Sign up page'),
      ),
    );
  }
}