import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/custom_shimmer.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CustomShimmer(width: 120.w, height: 120.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomShimmer(width: 30.w, height: 30.h),
                    const SizedBox(width: 10),
                    CustomShimmer(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 20.h,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomShimmer(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: 15,
                ),
                SizedBox(height: 10.h),
                CustomShimmer(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 15.h,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShimmer(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 15.h,
                    ),
                    CustomShimmer(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
