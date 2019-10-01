import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newz_app/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The LoadingScreen widget
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// The LoadingScreen state
class _LoadingScreenState extends State<LoadingScreen> {
  // Getting all the news about a topic (HARD CODED TEMPORARLY)
  void setupNewsApiDataGathering(String country) async {
    Topic newTopic = Topic(country: country);
    // Waiting to retrive the news
    List<Article> news = await newTopic.getNews();
    // Pushing to the HomeScreen route with the data as arguments
    Navigator.pushReplacementNamed(context, '/main', arguments: news.toList());
  }

  // Access the local storage and get the country
  void accessSharedPreferences() async {
    await new Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String country = prefs.getString('country');
    if (country != null) {
      // Setting up the app by fetching the data from News API
      setupNewsApiDataGathering(country);
    }else {
      // Pushing to the HomeScreen route with the data as arguments
      Navigator.pushReplacementNamed(context, '/settings/country');
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the shared preferences to fetch the country from local storage
    accessSharedPreferences();
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
