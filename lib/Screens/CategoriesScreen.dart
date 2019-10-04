import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Handling choosing a category
    void chooseCategory(String category) async {
      // Setting things up
      Topic newTopic = Topic();
      List<Article> news = await newTopic.searchByTerm(category);
      // Push to the category route with the data
      Navigator.pushNamed(context, '/category', arguments: {
        'news': news.toList(),
        'category': category
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 0, 8.0),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
            // Building the whole ListView
            child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Sports'),
              onTap: () {
                chooseCategory('Sports');
              },
              leading: Icon(Icons.fitness_center),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            ),
            ListTile(
              title: Text('Food and beverage'),
              onTap: () {
                chooseCategory('Food and beverage');
              },
              leading: Icon(Icons.fastfood),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            ),
            ListTile(
              title: Text('Technology'),
              onTap: () {
                chooseCategory('Technology');
              },
              leading: Icon(Icons.computer),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            ),
            ListTile(
              title: Text('Science'),
              onTap: () {
                chooseCategory('Science');
              },
              leading: Icon(Icons.school),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            ),
          ],
        )),
      ],
    );
  }
}
