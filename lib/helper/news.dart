import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=e72c23d851374d16a4def92a42f289fc';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      if (jsonData['articles'] != null) {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'] ??
                  '', // Use null check and provide a default value
              author: element['author'] ??
                  '', // Use null check and provide a default value
              description: element['description'] ??
                  '', // Use null check and provide a default value
              url: element['url'] ??
                  '', // Use null check and provide a default value
              urlToImage: element['urlToImage'] ??
                  '', // Use null check and provide a default value
              content: element['content'] ??
                  '', // Use null check and provide a default value
            );
            news.add(articleModel);
          }
        });
      }
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=e72c23d851374d16a4def92a42f289fc';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      if (jsonData['articles'] != null) {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'] ??
                  '', // Use null check and provide a default value
              author: element['author'] ??
                  '', // Use null check and provide a default value
              description: element['description'] ??
                  '', // Use null check and provide a default value
              url: element['url'] ??
                  '', // Use null check and provide a default value
              urlToImage: element['urlToImage'] ??
                  '', // Use null check and provide a default value
              content: element['content'] ??
                  '', // Use null check and provide a default value
            );
            news.add(articleModel);
          }
        });
      }
    }
  }
}
