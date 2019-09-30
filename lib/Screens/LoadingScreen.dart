import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newz_app/news.dart';

// The LoadingScreen widget
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// The LoadingScreen state
class _LoadingScreenState extends State<LoadingScreen> {
  
  // Getting all the news about a topic (HARD CODED TEMPORARLY)
  void setupNewsApiDataGathering() async {
    Topic newTopic = Topic(topic: 'Apple', country: 'us');
    // Waiting to retrive the news
    List<Article> news = await newTopic.getNews();
    // Pushing to the HomeScreen route with the data as arguments
    Navigator.pushReplacementNamed(context, '/main', arguments: news.toList());
  }

  @override
  void initState() {
    super.initState();
    // Setting up the app by fetching the data from News API
    setupNewsApiDataGathering();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
