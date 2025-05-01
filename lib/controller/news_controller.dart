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
  RxBool isNewsForYouLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBusinessLoading = false.obs;
  RxBool isSpeaking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  // for status code 426
  // var isAppleAccessDenied = false.obs;
  // var isTeslaAccessDenied = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    // getAppleNews();
    // getTeslaNews();
    getBusinessNews();
  }

  // method to get trending news
  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;

    final url =
        "${ApiConstants.baseUrl}/top-headlines?sources=techcrunch&apiKey=${ApiConstants.apiKey}";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        final body = jsonDecode(response.body);
        final articles = body["articles"];
        trendingNewsList.clear();
        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Failed to fetch trending news: ${response.statusCode}");
      }

      print("Trending news count: ${trendingNewsList.length}");
    } catch (e) {
      print("Exception in getTrendingNews: $e");
    } finally {
      isTrendingLoading.value = false;
    }
  }

  // method to get news for you
  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;

    final url =
        "${ApiConstants.baseUrl}/everything?domains=wsj.com&apiKey=${ApiConstants.apiKey}";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("Error fetching getNewsForYou news: ${response.statusCode}");
      }
      print("getNewsForYou news count: ${trendingNewsList.length}");
    } catch (e) {
      print("Exception in getNewsForYou: $e");
    } finally {
      isNewsForYouLoading.value = false;
    }
  }

  // method to get Apple news
  // this api is paid status code = 426
//   Future<void> getAppleNews() async {
//     isAppleLoading.value = true;
//     isAppleAccessDenied.value = false; // Reset before request
//     print("Fetching Apple news...");

//     final url =
//         "${ApiConstants.baseUrl}/everything?q=apple&from=2024-01-21&to=2024-01-21&sortBy=popularity&apiKey=${ApiConstants.apiKey}";

//     try {
//       final response = await http.get(Uri.parse(url));
//       print("Response status: ${response.statusCode}");

//       if (response.statusCode == 200) {
//         print("Apple news fetched successfully.");
//         final body = jsonDecode(response.body);
//         final articles = body["articles"];
//         print("Total articles fetched: ${articles.length}");

//         appleNewsList.clear();

//         for (var news in articles) {
//           appleNewsList.add(NewsModel.fromJson(news));
//         }

//         isAppleAccessDenied.value = false;

//         apple5News.value = appleNewsList.sublist(0, 5).obs;

//         print("apple5News count: ${apple5News.length}");
//       } else if (response.statusCode == 426) {
//         print("You don't have access to this section (status 426).");
//         isAppleAccessDenied.value = true;

//         appleNewsList.clear();
//         apple5News.clear();
//       } else {
//         print("Error fetching Apple news: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Exception in getAppleNews: $e");
//     } finally {
//       isAppleLoading.value = false;
//       print("Apple news loading complete.");
//     }
//   }

//   // method to get tesla news
//   // this api is paid status code = 426
//   Future<void> getTeslaNews() async {
//   isTeslaLoading.value = true;
//   isTeslaAccessDenied.value = false; // Make sure to declare this in your controller if not yet

//   var baseURL =
//       "${ApiConstants.baseUrl}/everything?q=tesla&from=2023-12-22&sortBy=publishedAt&apiKey=${ApiConstants.apiKey}";

//   try {
//     var response = await http.get(Uri.parse(baseURL));
//     print("Tesla response status: ${response.statusCode}");

//     if (response.statusCode == 200) {
//       print("Tesla news fetched successfully.");
//       print(response.body);

//       var body = jsonDecode(response.body);
//       var articles = body["articles"];
//       print("Total Tesla articles fetched: ${articles.length}");

//       teslaNewsList.clear();
//       for (var news in articles) {
//         teslaNewsList.add(NewsModel.fromJson(news));
//       }

//       isTeslaAccessDenied.value = false; // reset if previously true

//       tesla5News.value = teslaNewsList.sublist(0, 5).obs;

//       print("tesla5News count: ${tesla5News.length}");
//     } 
//     else if (response.statusCode == 426) {
//       print("You don't have access to Tesla news (status code 426).");
//       isTeslaAccessDenied.value = true;

//       teslaNewsList.clear();
//       tesla5News.clear();
//     } 
//     else {
//       print("Something went wrong in Tesla News: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Exception in getTeslaNews: $e");
//   } finally {
//     isTeslaLoading.value = false;
//     print("Tesla news loading complete.");
//   }
// }


  // method to get business news
  Future<void> getBusinessNews() async {
    isBusinessLoading.value = true;
    final url =
        "${ApiConstants.baseUrl}/top-headlines?country=us&category=business&apiKey=${ApiConstants.apiKey}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        final body = jsonDecode(response.body);
        final articles = body["articles"];
        for (var news in articles) {
          businessNewsList.add(NewsModel.fromJson(news));
        }
        business5News.value = businessNewsList.sublist(0, 5).obs;
      } else {
        print("Error fetching getBusinessNews news: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception in getBusinessNews: $e");
    } finally {
      isBusinessLoading.value = false;
    }
  }

  // Future<void> searchNews(String search) async {
  //   isNewsForYouLoading.value = true;
  //   var baseURL =
  //       "https://newsapi.org/v2/everything?q=$search&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
  //   try {
  //     var response = await http.get(Uri.parse(baseURL));
  //     print(response);
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       var body = jsonDecode(response.body);
  //       var articals = body["articles"];
  //       newsForYouList.clear();
  //       int i = 0;
  //       for (var news in articals) {
  //         i++;
  //         newsForYouList.add(NewsModel.fromJson(news));
  //         if (i == 10) {
  //           break;
  //         }
  //       }
  //     } else {
  //       print("Something went Wrong in Tranding News");
  //     }
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   isNewsForYouLoading.value = false;
  // }

  // Future<void> speak(String text) async {
  //   isSpeaking.value = true;
  //   await flutterTts.setLanguage("en-US");
  //   await flutterTts.setPitch(1);
  //   await flutterTts.setSpeechRate(0.5);
  //   await flutterTts.speak(text);
  //   isSpeaking.value = false;
  // }

  // void stop() async {
  //   await flutterTts.stop();
  //   isSpeeking.value = false;
  // }
}
