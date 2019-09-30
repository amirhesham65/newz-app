import 'dart:convert';
import 'package:http/http.dart';

// A single News post definition
class NewsPost {
  String source;
  String title;
  String description;
  String image;
  String author;
  String url;
  DateTime publishedAt;
  
  // The NewsPost constructor to pass the data
  NewsPost({ this.source, this.title, this.description, this.image, this.author, this.url, this.publishedAt});  
}

// A news topic definition
class Topic {
  String topic;
  String country;
  List<NewsPost> news;

  Topic({ this.topic, this.country });

  // Getting all the news related to the the topic
  Future<List> getNews() async {
    Response response = await get('https://newsapi.org/v2/top-headlines?country=$country&apiKey=d3442b53f9d24711878e06f62a121f78');
    Map<String, dynamic> data = jsonDecode(response.body);
    List articles = data['articles'];
    // Serialization
    news = articles.map((article) => NewsPost(
      source: article['source']['name'],
      title: article['title'],
      description: article['description'],
      author: article['author'],
      image: article['urlToImage'],
      url: article['url'],
      publishedAt: DateTime.parse(article['publishedAt'])
    )).toList();
    return news;
  }
}

