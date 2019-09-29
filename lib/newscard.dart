import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';

class NewsCard extends StatelessWidget {

  final NewsPost newsPost;

  NewsCard({this.newsPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                "https://static.politico.com/a7/8b/298bec5e41a4b4f39c643c24b884/190927-baltimore-gty-773.jpg",
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
                    newsPost.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
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
}
