import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/components/custom_appbar.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    return WillPopScope(
      onWillPop: () async {
        newsController.stop(); //  Stop speech
        Get.delete<
          NewsController
        >(); //  Destroy controller to trigger onClose()
        return true; // Allow back navigation
      },

      child: Scaffold(
        appBar: const CustomAppbar(),

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
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 30,
                    child: Row(
                      children: [
                        Obx(
                          () =>
                              newsController.isSpeaking.value
                                  ? IconButton(
                                    onPressed: () {
                                      newsController.stop();
                                    },
                                    icon: Icon(Icons.stop, size: 50),
                                  )
                                  : IconButton(
                                    onPressed: () {
                                      newsController.speak(
                                        news.description ?? "No Description",
                                      );
                                    },
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      size: 50,
                                    ),
                                  ),
                        ),
                        Expanded(
                          child: Obx(
                            () => Lottie.asset(
                              'Assets/Animation/wave.json',
                              height: 70,
                              animate: newsController.isSpeaking.value,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
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
      ),
    );
  }
}
