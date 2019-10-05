import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';
import 'package:newz_app/state_container.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard({ this.article });

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    // Check if all the data is fetched
    if (article.title != null &&
        article.description != null &&
        article.author != null &&
        article.image != null &&
        article.source != null) {
      return GestureDetector(
        onTap: () {
          // Go to the Article widget with all the data about the article
          Navigator.pushNamed(context, '/article', arguments: article);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(
                    article.image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.source,
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
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8.0),
                      FlatButton(
                        onPressed: () {
                          container.addToArticles(article);
                          print(container.articles);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.bookmark_border),
                            SizedBox(width: 4.0),
                            Text("Save Article")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 1.0,
    );
  }
}
