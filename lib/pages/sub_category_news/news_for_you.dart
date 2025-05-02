import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/components/back_appbar.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/pages/homepage/widgets/news_tile_card.dart';
import 'package:news_app/pages/newsdetail/news_detail_page.dart';

class NewsForYou extends StatelessWidget {
  const NewsForYou({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      appBar: BackAppbar(title: 'News For You'),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Column(
            children:
                newsController.newsForYouList
                    .map(
                      (e) => NewsTile(
                        ontap: () {
                          Get.to(
                          NewsDetailPage(news: e)
                          );
                        },
                        imageUrl:
                            e.urlToImage?.isNotEmpty == true
                                ? e.urlToImage!
                                : "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                        title: e.title ?? "No Title",
                        author: e.author ?? "Unknown",
                        time: e.publishedAt ?? "Unknown",
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
