import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common_widgets/back_appbar.dart';
import 'package:news_app/model/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppbar(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),

                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      news.urlToImage ??
                          "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  news.title ?? 'No Title Available',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      news.publishedAt!,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        (news.author?.isNotEmpty == true)
                            ? news.author![0]
                            : '?',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      news.author!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        news.description ?? "No Description Avialable",
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
