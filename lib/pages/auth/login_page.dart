import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/components/custom_button.dart';
import 'package:news_app/controller/auth_controller.dart';
import 'package:news_app/homepage_controller.dart';
import 'package:news_app/pages/auth/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back 👋',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Login to your account',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),

              // Email Field
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 16.h),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(height: 24.h),

              // Login Button or Loading Indicator
              Obx(() {
                if (authController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  text: 'Login',
                  onPressed: () async {
                    await authController.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (authController.errorMessage.value.isEmpty) {
                      Get.offAll(
                        () => const HomepageController(),
                      ); // Navigate on success
                    } else {
                      Get.snackbar(
                        "Login Failed",
                        authController.errorMessage.value,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  },
                );
              }),
              SizedBox(height: 16.h),

              // Footer for signup
              TextButton(
                onPressed: () {
                  Get.to(() => SignupPage());
                },
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
