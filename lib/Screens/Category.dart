import 'package:flutter/material.dart';
import 'package:newz_app/Article.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accepting the chosen category
    Map category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(category['category']),
      ),
      body: ListView.builder(
        itemCount: category['news'].length,
        itemBuilder: (context, index) {
          return NewsCard(article: category['news'][index]);
        },
      ),
    );
  }
}
