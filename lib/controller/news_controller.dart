import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:news_app/constant/api_constants.dart';
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> searchNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> business5News = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBuisLoading = false.obs;
  RxBool isSpeeking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  

  // method to get trending news
  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;

    final url =
        "${ApiConstants.baseUrl}/top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}";

    try {
      final response = await http.get(Uri.parse(url));
      print(response);

      if (response.statusCode == 200) {
        print(response.body);
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went wrong in Trending News");
      }
      print(trendingNewsList.length);
    } catch (ex) {
      print("Exception: $ex");
    } finally {
      isTrendingLoading.value = false;
    }
  }

  // method to get news for you
  Future<void> getNewsForYou() async {
    //"${ApiConstants.baseUrl}top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}",
  }

  // method to get Apple news
  Future<void> getAppleNews() async {
    //"${ApiConstants.baseUrl}top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}",
  }

  // method to get tesla news
  Future<void> getTeslaNews() async {
    //"${ApiConstants.baseUrl}top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}",
  }

  // method to get business news
  Future<void> getBusinessNews() async {
    //"${ApiConstants.baseUrl}top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}",
  }
}
