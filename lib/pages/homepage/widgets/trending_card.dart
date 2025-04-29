import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  
  const TrendingCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),  
      padding: EdgeInsets.all(5.w),
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),  
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Container(
            height: 200.h,  
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),  
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),  
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.sp),  
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.sp),  
              ),
            ],
          ),
          SizedBox(height: 5.h), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),  
          Row(
            children: [
              SizedBox(width: 10.w),  
              CircleAvatar(
                radius: 15.r,  
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              SizedBox(width: 10.w), 
              Text(
                author,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.sp),  
              ),
            ],
          ),
        ],
      ),
    );
  }
}
