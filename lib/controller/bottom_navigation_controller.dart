import 'package:get/get.dart';
import 'package:news_app/pages/article/article.dart';
import 'package:news_app/pages/homepage/homepage.dart';
import 'package:news_app/pages/profile/profile.dart';

class BottomNavController extends GetxController{
  RxInt index = 0.obs;

   var pages = [
    const Homepage(),
    const Articlepage(),
    const Profilepage(),
  ];
}
