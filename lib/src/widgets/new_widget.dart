import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:url_launcher/url_launcher.dart';

class New extends StatelessWidget {
  final Article? article;

  const New({this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (article!.url != null) launch(article!.url!);
          return;
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black26),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (article!.author != null)
                    Text(
                      article!.author!,
                      style: TextStyle(
                        fontSize: 8,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  Text(
                    article!.title!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: (article!.urlToImage != null)
                  ? FadeInImage(
                      placeholder: AssetImage("assets/img/giphy.gif"),
                      image: NetworkImage(
                        article!.urlToImage!,
                      ),
                    )
                  : Image.asset("assets/img/no-image.png"),
            ),
          ],
        ),
      ),
    );
  }
}
