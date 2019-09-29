import 'package:flutter/material.dart';
import 'package:newz_app/Screens/HomeScreen.dart';
import 'package:newz_app/Screens/LoadingScreen.dart';

void main() => runApp(MyApp());

String apiKey = "d3442b53f9d24711878e06f62a121f78"; 

// The App root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Routing controller
      routes: {
        '/': (context) => LoadingScreen(),
        '/main': (context) => AppMainScreen()
      },
    );
  }
}

// The AppMainScreen widget controlling the different tabs
class AppMainScreen extends StatefulWidget {
  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

// The state of the AppMainScreen widget
class _AppMainScreenState extends State<AppMainScreen> {
  int _selectedIndex = 0;

  List<Widget> _views = [HomeScreen()];

  void _onSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newz'),
      ),
      body: Center(
        child: _views.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
        onTap: _onSwitch,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[600],
      ),
    );
  }
}
