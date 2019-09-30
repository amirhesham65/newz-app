import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';

class NewsCard extends StatelessWidget {
  final NewsPost newsPost;

  NewsCard({this.newsPost});

  @override
  Widget build(BuildContext context) {
    if (newsPost.title != null &&
        newsPost.description != null &&
        newsPost.author != null &&
        newsPost.image != null &&
        newsPost.source != null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  newsPost.image,
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
                      newsPost.source,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      newsPost.title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      newsPost.description,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox(height: 1.0,);
  }
}
