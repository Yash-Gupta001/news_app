import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/article/widgets/search_widgets.dart';
import 'package:news_app/pages/newsdetail/news_detail_page.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20.h),
              Obx(
                () => Column(
                  children:
                      newsController.trendingNewsList
                          .map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(NewsDetailPage(news: e));
                              },
                              imageUrl:
                                  e.urlToImage ??
                                  "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                              title: e.title!,
                              author: e.author ?? "Unknown",
                              time: e.publishedAt!,
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
