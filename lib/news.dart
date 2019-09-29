import 'dart:convert';
import 'package:http/http.dart';

// A single News post definition
class NewsPost {
  String title;
  String description;

  NewsPost({ this.title, this.description});  
}

// A news topic definition
class Topic {
  String topic;
  List<NewsPost> news;

  Topic({ this.topic });

  // Getting all the news related to the the topic
  Future<void> getNews() async {
    Response response = await get('https://newsapi.org/v2/everything?q=$topic&apiKey=d3442b53f9d24711878e06f62a121f78');
    Map<String, dynamic> data = jsonDecode(response.body);
    List articles = data['articles'];
    news = articles.map((article) => NewsPost(title: article['title'], description: article['description'])).toList();
    print(news[1].title);
  }
}

