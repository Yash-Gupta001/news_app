import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/homepage/widgets/trending_card.dart';
import 'package:news_app/pages/newsdetail/news_detail_page.dart';
import 'package:news_app/pages/profile/profile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: IconButton(
                onPressed: () {
                  // Get.to(
                  //   NewsDetailPage(),
                  // );
                },
                icon: Icon(Icons.dashboard),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            Text(
              "News App",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "popins",
              ),
            ),
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(
                    Profilepage(),
                  );
                },
                icon: Icon(Icons.person),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    "See All",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...newsController.trendingNewsList.map(
                        (e) => TrendingCard(
                          onTap: () {
                            Get.to(NewsDetailPage());
                          },
                          imageUrl: e.urlToImage!,
                          tag: 'Trending no 1',
                          time: e.publishedAt!,
                          title: e.title ?? '',
                          author: e.author ?? 'unknown',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    "See All",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  NewsTile(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                    title: "title",
                    time: "time",
                    author: "author",
                  ),

                  NewsTile(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                    title: "title",
                    time: "time",
                    author: "author",
                  ),

                  NewsTile(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                    title: "title",
                    time: "time",
                    author: "author",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
