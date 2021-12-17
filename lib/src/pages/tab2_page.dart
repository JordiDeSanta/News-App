import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: _CategoriesList(),
            ),
            Expanded(child: NewsList(newsService.getArticlesOfCategory)),
          ],
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
          padding: EdgeInsets.all(5.0),
          child: _CategoryButton(categories[i]),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return ElevatedButton(
      onPressed: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black26),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: [
            Icon(
              category.icon,
              color: (newsService.selectedCategory == this.category.name)
                  ? Theme.of(context).accentColor
                  : Colors.grey,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              category.t,
              style: TextStyle(
                color: (newsService.selectedCategory == this.category.name)
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
