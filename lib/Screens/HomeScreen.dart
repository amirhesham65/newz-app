import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';
import 'package:newz_app/newscard.dart';

class HomeScreen extends StatelessWidget {
  final List<NewsPost> myNews = [
    NewsPost(
        title: 'First article',
        description:
            'In order to support aggressive composability at the widget layer, Flutter uses a number of efficient algorithms and optimizations at both the widget and render tree layers, which are described in the following subsections.'),
    NewsPost(
        title: 'Second article',
        description:
            'In order to support aggressive composability at the widget layer, Flutter uses a number of efficient algorithms and optimizations at both the widget and render tree layers, which are described in the following subsections.'),
    NewsPost(
        title: 'Third article',
        description:
            'In order to support aggressive composability at the widget layer, Flutter uses a number of efficient algorithms and optimizations at both the widget and render tree layers, which are described in the following subsections.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 0, 8.0),
          child: Text('Recent News'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: myNews.length,
            itemBuilder: (context, index) {
              return NewsCard(newsPost: myNews[index]);
            },
          ),
        ),
      ],
    );
  }
}
