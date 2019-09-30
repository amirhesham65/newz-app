import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';
import 'package:newz_app/newscard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<NewsPost> myNews = ModalRoute.of(context).settings.arguments;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 0, 8.0),
          child: Text(
            'Recent News',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
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
