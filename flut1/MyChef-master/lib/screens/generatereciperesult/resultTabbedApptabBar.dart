import 'package:flutter/material.dart';
import 'package:mychef/widgets/BookmarkCardFixIngredients.dart';
import 'package:mychef/widgets/BookmarkCardFixInstructions.dart';
import 'package:mychef/widgets/Recipe.dart';

class ResultTabbedApp extends StatelessWidget {
  final List<String> tabTitles;
  final int numberOfTabs;
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
  ];

  ResultTabbedApp({required this.tabTitles, required this.numberOfTabs});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: numberOfTabs,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Increase horizontal padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TabBar(
                tabs: _buildTabs(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.orange,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                onTap: (index) {
                  // Handle tab click here
                },
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BookmarkCardFixIngredients(recipe: recipes[0]),
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BookmarkCardFixInstructions(recipe: recipes[0]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    return List.generate(
      numberOfTabs,
      (index) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8.0), // Adjust the horizontal padding
        child: Tab(
          text: tabTitles[index],
        ),
      ),
    );
  }
}
