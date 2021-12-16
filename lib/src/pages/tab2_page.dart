import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [Expanded(child: _CategoriesList())],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext c, int i) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            categories[i].t,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        );
      },
    );
  }
}
