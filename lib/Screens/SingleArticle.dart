import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newz_app/news.dart';
import 'package:share/share.dart';

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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
            child: IconButton(
              onPressed: () {
                Share.share('Check this article by "${article.author}" via "${article.source}" at ${article.url}"');
              },
              icon: Icon(Icons.share)
              ),
          )
        ],
        
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
                    'Published at: ${DateFormat('h:m').format(article.publishedAt)}',
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
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Written by: ${article.author}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
