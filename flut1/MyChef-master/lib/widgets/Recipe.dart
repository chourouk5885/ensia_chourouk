import 'dart:convert';

typedef _JsonMap = Map<String, dynamic>;

class Recipe {
  final String title;
  final String subtitle;
  final String kcal;
  final String expertise;
  final String time;
  final String ingredients;
  final String instructions;
  final String Meal;

  Recipe({
    required this.title,
    required this.Meal,
    required this.subtitle,
    required this.kcal,
    required this.expertise,
    required this.time,
    required this.ingredients,
    required this.instructions,
  });

  Recipe.fromGeneratedRecipe(_JsonMap generatedRecipe)
      : title = generatedRecipe['title'] ?? 'Title Not Found',
        subtitle = generatedRecipe['subtitle'] ?? 'Subtitle Not Found',
        kcal = generatedRecipe['calories'] ?? 'Calories Not Found',
        expertise = generatedRecipe['CookingLevel'] ?? 'Expertise Not Found',
        time = generatedRecipe['CookTime'] ?? 'Time Not Found',
        ingredients = generatedRecipe['ingredients'] ?? 'Ingredients Not Found',
        Meal = generatedRecipe['Meal'] ?? 'Meal Not Found',
        instructions =
            generatedRecipe['instructions'] ?? 'Instructions Not Found';
}
