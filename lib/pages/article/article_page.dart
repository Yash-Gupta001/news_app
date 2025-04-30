import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/article/widgets/search_widgets.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchWidget(),
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
