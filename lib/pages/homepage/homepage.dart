import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/homepage/widgets/trending_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontSize: 24.sp),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                      tag: 'news tag',
                      time: 'time',
                      title: 'this is title',
                      author: 'this is author',
                    ),

                    TrendingCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                      tag: 'news tag',
                      time: 'time',
                      title: 'this is title',
                      author: 'this is author',
                    ),

                    TrendingCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s",
                      tag: 'news tag',
                      time: 'time',
                      title: 'this is title',
                      author: 'this is author',
                    ),
                  ],
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
