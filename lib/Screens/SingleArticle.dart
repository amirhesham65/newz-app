import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';

class SingleArticleView extends StatefulWidget {
  @override
  _SingleArticleViewState createState() => _SingleArticleViewState();
}

class _SingleArticleViewState extends State<SingleArticleView> {
  @override
  Widget build(BuildContext context) {
    // Getting the article from the Article widget
    final Article article = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.source),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(article.image),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Written by: ${article.author}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    article.description,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
