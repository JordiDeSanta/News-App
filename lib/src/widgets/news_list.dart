import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (context, i) {
        return Text(this.news[i].title!);
      },
    );
  }
}
