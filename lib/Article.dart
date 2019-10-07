import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';
import 'package:newz_app/state_container.dart';

class NewsCard extends StatefulWidget {
  final Article article;
  
  NewsCard({Key key, this.article}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    if (container.checkIfSaved(widget.article)) {
      setState(() {
        isSaved = true;
      });
    }
    // Check if all the data is fetched
    if (widget.article.title != null &&
        widget.article.description != null &&
        widget.article.author != null &&
        widget.article.image != null &&
        widget.article.source != null) {
      return GestureDetector(
        onTap: () {
          // Go to the Article widget with all the data about the article
          Navigator.pushNamed(context, '/article', arguments: widget.article);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(
                    widget.article.image,
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
                        widget.article.source,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.article.title,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.article.description,
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8.0),
                      FlatButton(
                        onPressed: () {
                          if (!isSaved) {
                            container.addToArticles(widget.article);
                            setState(() {
                              isSaved = true;
                            });
                          }else {
                            container.removeFromArticles(widget.article);
                            setState(() {
                              isSaved = false;
                            });
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon((isSaved)
                                ? Icons.bookmark
                                : Icons.bookmark_border),
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
