import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontap;

  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
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
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
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
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Text(
                            author.isNotEmpty ? author[0] : '?',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Text(
                          author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 11.sp),
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
