import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "newsapi.org";
final _API_KEY = "cba7aab3a5814b9dade3cd5686fec722";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  List<Category> categories = [
    Category(FontAwesomeIcons.cashRegister, 'business', 'Business'),
    Category(FontAwesomeIcons.tv, 'entertainment', 'Entertainment'),
    Category(FontAwesomeIcons.gripLinesVertical, 'general', 'General'),
    Category(FontAwesomeIcons.bookMedical, 'health', 'Health'),
    Category(FontAwesomeIcons.atom, 'science', 'Science'),
    Category(FontAwesomeIcons.footballBall, 'sports', 'Sports'),
    Category(FontAwesomeIcons.phone, 'technology', 'Technology'),
  ];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = Uri.https(_URL_NEWS, '/v2/top-headlines', {
      'country': 'ar',
      'apiKey': _API_KEY,
    });

    final response = await http.get(url);

    final newsResponse = newsModelFromJson(response.body);

    this.headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }
}
