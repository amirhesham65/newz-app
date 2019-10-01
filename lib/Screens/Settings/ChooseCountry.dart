import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCountrySettings extends StatefulWidget {
  @override
  _ChooseCountrySettingsState createState() => _ChooseCountrySettingsState();
}

class _ChooseCountrySettingsState extends State<ChooseCountrySettings> {
  // Hold the list of countries in the state
  List countries = [];

  // Fetching all the countries from RestCountries API
  void setupCountriesApiDataGathering() async {
    Response response = await get('https://restcountries.eu/rest/v2/all');
    List countriesData = jsonDecode(response.body);
    setState(() {
      countries = countriesData.map((country) => {
      'name': country['name'],
      'code': country['alpha2Code'],
      'flag': country['flag']
      }).toList();
    });
  } 

  // When a country is selected, set the shared preference
  void selectCountry(country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('country', country['code']);
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }

  @override
  void initState(){
    super.initState();
    // Setting up the Countries API and get countries
    setupCountriesApiDataGathering();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose country'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                selectCountry(countries[index]);
              },
              title: Text(countries[index]['name']),
            ),
          );
        },
      ),
    );
  }
}