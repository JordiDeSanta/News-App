import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class New extends StatelessWidget {
  final Article? article;

  const New({this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Column(
          children: [
            Text(article!.title!),
            Image.network(article!.urlToImage!),
          ],
        ),
      ),
    );
  }
}
