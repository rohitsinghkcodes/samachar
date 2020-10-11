
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:samachar/Model/article_model.dart';

//SECTION FOR HOME NEWS
class NewsFetch {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=10ccf053cfb143159c6285de1397e4a3';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              authorName: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

//SECTION FOR CATEGORY NEWS
class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=10ccf053cfb143159c6285de1397e4a3';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              authorName: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}
