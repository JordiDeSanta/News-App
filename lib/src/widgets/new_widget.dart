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
          backgroundColor: MaterialStateProperty.all(Colors.black26),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                article!.title!,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
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
