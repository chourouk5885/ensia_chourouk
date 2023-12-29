import 'package:flutter/material.dart';
import 'package:mychef/widgets/BookmarkCardFixIngredients.dart';
import 'package:mychef/widgets/BookmarkCardFixInstructions.dart';
import 'package:mychef/widgets/Recipe.dart';

typedef _JsonMap = Map<String, dynamic>;

class ResultTabbedApp extends StatelessWidget {
  final List<String>? tabTitles; // Use nullable list
  final int numberOfTabs;
  final _JsonMap generatedRecipe;

  ResultTabbedApp({
    required this.tabTitles,
    required this.numberOfTabs,
    required this.generatedRecipe,
  });

  @override
  Widget build(BuildContext context) {
    // Check if tabTitles is null and provide a default value if needed
    final List<String> validTabTitles = tabTitles ?? [];

    return DefaultTabController(
      length: numberOfTabs,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TabBar(
                tabs: _buildTabs(context, validTabTitles),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BookmarkCardFixIngredients(
                  recipe: Recipe.fromGeneratedRecipe(generatedRecipe),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BookmarkCardFixInstructions(
                  recipe: Recipe.fromGeneratedRecipe(generatedRecipe),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context, List<String> validTabTitles) {
    double screenWidth = MediaQuery.of(context).size.width;

    return List.generate(
      numberOfTabs,
      (index) => Container(
        width: screenWidth / numberOfTabs,
        child: Tab(
          text: validTabTitles.length > index
              ? validTabTitles[index]
              : 'Default Title',
        ),
      ),
    );
  }
}
