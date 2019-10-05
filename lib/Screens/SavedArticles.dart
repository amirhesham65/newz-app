import 'package:flutter/material.dart';
import 'package:newz_app/Article.dart';
import 'package:newz_app/state_container.dart';

class SavedArticles extends StatefulWidget {
  @override
  _SavedArticlesState createState() => _SavedArticlesState();
}

class _SavedArticlesState extends State<SavedArticles> {
  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: container.articles.length,
          itemBuilder: (context, index) {
            return NewsCard(article: container.articles[index]);
          },
        ),
      ),
    );
  }
}