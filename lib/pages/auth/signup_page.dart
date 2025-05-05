import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/custom_button.dart';
import 'package:news_app/controller/auth_controller.dart';
import 'package:news_app/pages/auth/login_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Register"),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32.h),
              Text(
                'Create New Account',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              // Email Field
              Text('Email', style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 8.h),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Password Field
              Text('Password', style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 8.h),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // Register Button or Loader
              Obx(() {
                if (authController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  text: 'Register',
                  onPressed: () async {
                    await authController.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (authController.errorMessage.value.isEmpty) {
                      Get.snackbar(
                        "Success",
                        "Registration successful. Please log in.",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      Get.off(() => LoginPage());
                    } else {
                      Get.snackbar(
                        "Registration Failed",
                        authController.errorMessage.value,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                );
              }),

              SizedBox(height: 24.h),

              // Already have account
              TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: Text(
                  'Already have an account? Login',
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
