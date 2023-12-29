import 'package:flutter/material.dart';
import 'package:mychef/screens/generatereciperesult/resultTabbedApptabBar.dart';

typedef _JsonMap = Map<String, dynamic>;

class Generatereciperesult extends StatelessWidget {
  final _JsonMap generatedRecipe;

  Generatereciperesult({required this.generatedRecipe});
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
        tabTitles: ['Ingredients', 'Instructions'],
        numberOfTabs: 2,
        generatedRecipe: generatedRecipe,
      ),
    ));
  }
}
