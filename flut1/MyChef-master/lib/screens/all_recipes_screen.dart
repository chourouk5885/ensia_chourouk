import 'package:flutter/material.dart';
import 'package:mychef/screens/description.dart';
import '../model/recipe.dart';
import '../services/firebase_service.dart';
import 'dart:math';

class AllRecipesScreen extends StatefulWidget {
  @override
  _AllRecipesScreenState createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  List<Recipe> allRecipes = [];
  Random random = Random();
  bool isLoading = true; // Attribute to track loading state

  @override
  void initState() {
    super.initState();
    _fetchRandomRecipes();
  }

  void _fetchRandomRecipes() async {
    setState(() {
      isLoading = true; // Set loading to true while fetching recipes
    });

    try {
      List<Recipe> fetchedRecipes = await _firebaseService.getAllRecipes();

      if (fetchedRecipes.length >= 50) {
        allRecipes = (fetchedRecipes..shuffle(random)).take(50).toList();
      } else {
        allRecipes = (fetchedRecipes..shuffle(random)).toList();
      }
    } catch (e) {
      print('Error fetching random recipes: $e');
    } finally {
      setState(() {
        isLoading = false; // Set loading to false after fetching recipes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'All Recipes',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orange), // Orange color
              ),
            )
          : ListView.builder(
              itemCount: allRecipes.length,
              itemBuilder: (context, index) {
                return _buildRecipeListItem(allRecipes[index]);
              },
            ),
    );
  }

  Widget _buildRecipeListItem(Recipe recipe) {
    return InkWell(
      onTap: () {
        // Implement navigation logic to description screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DescriptionScreen(recipe: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  recipe.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        recipe.subCategory.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        recipe.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${recipe.difficulty} / ${recipe.time}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 20),
                      SizedBox(width: 4),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
