import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back(); 
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  SizedBox(width: 5),
                  Text("Back"),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  height: 330.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text("Date", style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    CircleAvatar(radius: 15.r, backgroundColor: Colors.red),
                    SizedBox(width: 10.w),

                    Text(
                      "Author",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),

                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
