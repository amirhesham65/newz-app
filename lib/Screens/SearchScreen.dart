import 'package:flutter/material.dart';
import 'package:newz_app/Article.dart';
import 'package:newz_app/news.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Setting things up
  Topic newTopic = Topic();
  List<Article> myNews = [];
  bool showResults = true;

  // Searching for the news by term on changes
  void searchOnSubmit(term) async {
    List<Article> newsFetched = await newTopic.searchByTerm(term);
    if (newsFetched.length > 0) {
      setState(() {
        showResults = true;
      });
    } else {
      setState(() {
        showResults = false;
      });
    }
    setState(() {
      myNews = newsFetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter a search term'),
            onSubmitted: (String text) {
              searchOnSubmit(text);
            },
          ),
        ),
        Expanded(
          // Building the whole ListView
          child: (showResults == true)
              ? ListView.builder(
                  itemCount: myNews.length,
                  itemBuilder: (context, index) {
                    return NewsCard(article: myNews[index]);
                  },
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Sorry, no results! Try using another term",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
