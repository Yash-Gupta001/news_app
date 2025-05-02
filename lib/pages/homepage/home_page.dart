import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/homepage/widgets/trending_card.dart';
import 'package:news_app/pages/newsdetail/news_detail_page.dart';
import 'package:news_app/pages/profile/profile.dart';
import 'package:news_app/pages/sub_category_news/news_for_you.dart';

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
                onPressed: () {},
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
                  Get.to(Profilepage());
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
              // trending news
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
                  child:
                      newsController.isTrendingLoading.value
                          ? CircularProgressIndicator()
                          : Row(
                            children: [
                              ...newsController.trendingNewsList.map(
                                (e) => TrendingCard(
                                  onTap: () {
                                    Get.to(NewsDetailPage(news: e));
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

              // news for you
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for You",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(NewsForYou());
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () => SingleChildScrollView(
                  child:
                      newsController.isNewsForYouLoading.value
                          ? CircularProgressIndicator()
                          : Column(
                            children: [
                              ...newsController.newsForYou5.map(
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
                              ),
                            ],
                          ),
                ),
              ),

              SizedBox(height: 20.h),
              // Apple News
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(NewsForYou());
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () =>
                    newsController.isNewsForYouLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : newsController.isAppleAccessDenied.value
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdni.iconscout.com/illustration/premium/thumb/customer-rating-6992005-5706489.png",
                                width: 250.w,
                                height: 250.h,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "You don't have access to this section.",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        )
                        : SingleChildScrollView(
                          child: Column(
                            children:
                                newsController.apple5News
                                    .map(
                                      (e) => NewsTile(
                                        ontap: () {
                                          Get.to(() => NewsDetailPage(news: e));
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

              SizedBox(height: 20.h),
              // Business news
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(NewsForYou());
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () => SingleChildScrollView(
                  child:
                      newsController.isBusinessLoading.value
                          ? CircularProgressIndicator()
                          : Column(
                            children: [
                              ...newsController.business5News.map(
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
                              ),
                            ],
                          ),
                ),
              ),

              // tesla news
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(NewsForYou());
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () =>
                    newsController.isNewsForYouLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : newsController.isAppleAccessDenied.value
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdni.iconscout.com/illustration/premium/thumb/customer-rating-6992005-5706489.png",
                                width: 250.w,
                                height: 250.h,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "You don't have access to this section.",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        )
                        : SingleChildScrollView(
                          child: Column(
                            children:
                                newsController.tesla5News
                                    .map(
                                      (e) => NewsTile(
                                        ontap: () {
                                          Get.to(() => NewsDetailPage(news: e));
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
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
    );
  }
}
