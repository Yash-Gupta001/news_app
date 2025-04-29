import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/bottom_navigation_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottonNav extends StatelessWidget {
  const MyBottonNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          width: 200.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.index.value = 0;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: controller.index.value == 0
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 27.sp,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 1;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: controller.index.value == 1
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.book,
                        size: 27.sp,
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 2;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: controller.index.value == 2
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.settings,
                        size: 27.sp,
                        color: controller.index.value == 2
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
