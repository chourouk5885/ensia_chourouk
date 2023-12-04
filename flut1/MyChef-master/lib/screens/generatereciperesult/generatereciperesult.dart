import 'package:flutter/material.dart';
import 'package:mychef/screens/generatereciperesult/resultTabbedApptabBar.dart';

class Generatereciperesult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Recipe Result',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        // AppBar background color set to white
      ),
      body: ResultTabbedApp(
          tabTitles: ['Ingredients', 'Instructions'], numberOfTabs: 2),
    ));
  }
}
