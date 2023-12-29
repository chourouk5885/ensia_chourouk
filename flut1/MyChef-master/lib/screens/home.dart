import 'package:flutter/material.dart';
import 'package:mychef/screens/description.dart';
import '../model/recipe.dart';
import '../services/firebase_service.dart';
import 'dart:math';
import './all_recipes_screen.dart';
import './searched_recipe.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Recipe> todayRecipes = [];
  List<Recipe> fetchedRecipes = [];
  List<Recipe> recommendedRecipes = [];
  final FirebaseService _firebaseService = FirebaseService();
  bool isLoading = true;
  String searchQuery = "";
  List<Recipe> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  void _fetchRecipes() async {
    setState(() => isLoading = true); 
    try {
      fetchedRecipes = await _firebaseService.getAllRecipes();
      _processFetchedRecipes(fetchedRecipes);
    } catch (e) {
      print('Error fetching recipes: $e');
    } finally {
      setState(() => isLoading = false); // <-- End loading
    }
  }


void _processFetchedRecipes(List<Recipe> fetchedRecipes) {

  fetchedRecipes.shuffle(Random());

  final validRecipes = fetchedRecipes.where((recipe) => recipe.imageUrl != null).toList();

  final todayRecipes = validRecipes.take(10).toList();

  final recommendedRecipes = validRecipes.skip(10).take(30).toList();

  setState(() {
    this.todayRecipes = todayRecipes;
    this.recommendedRecipes = recommendedRecipes;
  });
}


void updateSearchQuery(String query) {
  if (query.isEmpty) {
    setState(() {
      searchResults = [];
    });
  } else {
    setState(() {
      searchResults = fetchedRecipes.where((recipe) {
        return (_isSimilar(recipe.name.toLowerCase(), query.toLowerCase())&&_isContained(recipe.name.toLowerCase(), query.toLowerCase()));
      }).toList();
    });
  }
}

bool _isSimilar(String recipeName, String query) {

  int matches = query.split('').where((char) => recipeName.contains(char)).length;
  double similarityRatio = matches / query.length;
  return similarityRatio >= 0.999999;
}
bool _isContained(String recipeName, String query) {
  return recipeName.contains(query);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Find the recipe you are looking for',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // <-- Prevent overflow
                ),
              ),
              SizedBox(width: 8), // Spacing between text and icon
              Icon(
                Icons.restaurant, // Icon that looks like a fork and knife
                color: Colors.black,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  _buildTodayRecipesSection(),
                  _buildRecommendedSection(),
                ],
              ),
            ),
    );
  }

  Widget _buildTodayRecipesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today Recipes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: todayRecipes.length,
            itemBuilder: (context, index) {
              return _buildRecipeCard(todayRecipes[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AllRecipesScreen(),
                    ),
                  );
                },
                child: Text(
                  'See More',
                  style: TextStyle(
                    color: Colors.black, // Black color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: recommendedRecipes.length,
          itemBuilder: (context, index) {
            return _buildRecipeListItem(recommendedRecipes[index]);
          },
        ),
      ],
    );
  }

Widget _buildSearchBar() {
   List<String> recipeNames = fetchedRecipes.map((recipe) => recipe.name).toList();

  void navigateToSearchedRecipes(String query) {
    var filteredRecipes = fetchedRecipes
        .where((recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchedRecipeScreen(recipes: filteredRecipes),
      ),
    );
  }

   return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        var matches = recipeNames
            .where((String option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase()))
            .toList();

        if (matches.isEmpty) {
          return ['No matches found'];
        }

        return matches.take(6); // Limit to the first 6 matches
      },
      onSelected: (String selection) {
        if (selection != 'No matches found') {
          var selectedRecipe = fetchedRecipes.firstWhere((recipe) => recipe.name == selection);
          navigateToDescription(selectedRecipe);
        }
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (String query) {
            navigateToSearchedRecipes(query);
          },
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Search for a recipe name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              color: Colors.white,
              // Adjust the height based on the number of items
              height: min(options.length * 48.0, 240.0), // 48.0 is an estimated height for each item
              child: ListView(
                padding: EdgeInsets.zero,
                children: options.map((String option) => GestureDetector(
                  onTap: () => option != 'No matches found' ? onSelected(option) : null,
                  child: ListTile(
                    title: Text(option),
                    enabled: option != 'No matches found', // Disable selection for 'No matches found'
                  ),
                )).toList(),
              ),
            ),
          ),
        );
      },
    ),
  );
}


  Widget _buildRecipeCard(Recipe recipe) {
    return GestureDetector(
      onTap: () => navigateToDescription(recipe),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.only(right: 16.0, bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                    child: Image.network(
                      recipe.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit
                          .cover, // This makes the image cover the entire space of the ClipRRect
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate,
                              color: Colors.amber,
                              size: 15,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "${recipe.rating.toStringAsFixed(1)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.amber,
                              size: 15,
                            ),
                            SizedBox(width: 4),
                            Text(
                              recipe.time,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    " ${recipe.subCategory}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    " ${recipe.difficulty}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDescription(Recipe recipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DescriptionScreen(recipe: recipe),
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
