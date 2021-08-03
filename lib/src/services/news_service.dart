import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "newsapi.org";
final _API_KEY = "cba7aab3a5814b9dade3cd5686fec722";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = Uri.https(_URL_NEWS, '/v2/top-headlines', {
      'country': 'ca',
      'apiKey': _API_KEY,
    });

    final response = await http.get(url);

    final newsResponse = newsModelFromJson(response.body);

    this.headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }
}
