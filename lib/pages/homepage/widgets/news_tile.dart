import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  
  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 17.h), 
        padding: EdgeInsets.all(10.w),  
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20.r),  
        ),
        child: Row(
          children: [
            Container(
              width: 120.w,  
              height: 120.h,  
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20.r),  
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r), 
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),  
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 10.r,  
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 10.w),  
                      Flexible(
                        child: Text(
                          author,
                          maxLines: 1,
                          style: TextStyle(fontSize: 14.sp),  
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),  
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16.sp),  
                  ),
                  SizedBox(height: 15.h), 
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12.sp),  
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
