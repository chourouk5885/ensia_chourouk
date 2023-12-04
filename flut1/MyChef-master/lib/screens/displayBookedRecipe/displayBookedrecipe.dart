import 'package:flutter/material.dart';
import 'package:mychef/widgets/Recipe.dart';
import 'package:mychef/widgets/custom_drop_down.dart';

class DisplayBookedrecipe extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Lunch Recipe',
      subtitle: 'Fried Chicken',
      kcal: '500 Kcal',
      expertise: 'Expert',
      time: '30:00 min',
      ingredients: [
        'Chicken pieces',
        'Buttermilk',
        'Flour',
        'Spices',
        'Oil',
      ],
      instructions: [
        '1. Marinate the Chicken:',
        '   • Place the chicken pieces in a bowl and pour the buttermilk over them.',
        '   • Make sure the chicken is well coated, cover the bowl, and refrigerate for at least 1 hour (or up to 24 hours for maximum flavor).',
        '2. Prepare the Coating:',
        '   • In a separate bowl, mix Lunch Fried Chicken 500 Kcal Instructions...',
      ],
    ),
    Recipe(
      title: 'Second Recipe',
      subtitle: 'Another Dish',
      kcal: '400 Kcal',
      expertise: 'Intermediate',
      time: '25:00 min',
      ingredients: [
        'Chicken pieces',
        'Buttermilk',
        'Flour',
        'Spices',
        'Oil',
      ],
      instructions: [
        '1. Marinate the Chicken:',
        '   • Place the chicken pieces in a bowl and pour the buttermilk over them.',
        '   • Make sure the chicken is well coated, cover the bowl, and refrigerate for at least 1 hour (or up to 24 hours for maximum flavor).',
        '2. Prepare the Coating:',
        '   • In a separate bowl, mix Lunch Fried Chicken 500 Kcal Instructions...',
      ],
    ),
    Recipe(
      title: 'third Recipe',
      subtitle: 'Another Dish',
      kcal: '400 Kcal',
      expertise: 'Intermediate',
      time: '25:00 min',
      ingredients: [
        'Chicken pieces',
        'Buttermilk',
        'Flour',
        'Spices',
        'Oil',
      ],
      instructions: [
        '1. Marinate the Chicken:',
        '   • Place the chicken pieces in a bowl and pour the buttermilk over them.',
        '   • Make sure the chicken is well coated, cover the bowl, and refrigerate for at least 1 hour (or up to 24 hours for maximum flavor).',
        '2. Prepare the Coating:',
        '   • In a separate bowl, mix Lunch Fried Chicken 500 Kcal Instructions...',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Colors.transparent, // Set divider color to transparent
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Saved recipes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          // AppBar background color set to white
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: recipes.map((recipe) {
              return BookmarkCard(
                recipe: recipe,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
