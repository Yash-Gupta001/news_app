import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/navigationbar.dart';
import 'package:news_app/controller/bottom_navigation_controller.dart';

class HomepageController extends StatelessWidget {
  const HomepageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      floatingActionButton: MyBottonNav(),
      body: Obx(() => 
      controller.pages[controller.index.value],
      )
      );
  }
}
