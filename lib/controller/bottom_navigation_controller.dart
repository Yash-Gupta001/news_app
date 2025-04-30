import 'package:get/get.dart';
import 'package:news_app/pages/article/article_page.dart';
import 'package:news_app/pages/homepage/home_page.dart';
import 'package:news_app/pages/profile/profile.dart';

class BottomNavController extends GetxController{
  RxInt index = 0.obs;

   var pages = [
    const Homepage(),
    const Articlepage(),
    const Profilepage(),
  ];
}
