import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Settings'),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/settings/country');
              },
                title: Text(
                  "Change location",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.edit_location)),
          )
        ],
      ),
    );
  }
}
