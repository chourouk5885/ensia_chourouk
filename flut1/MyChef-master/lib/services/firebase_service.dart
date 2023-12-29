import 'package:firebase_database/firebase_database.dart';
import '../model/recipe.dart';

class FirebaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<void> addRecipe(Recipe recipe) async {
    DatabaseReference ref = _database.ref('recipes').push();
    await ref.set(recipe.toMap());
  }

  Future<Recipe> getRecipe(String recipeId) async {
    DataSnapshot snapshot = await _database.ref('recipes/$recipeId').get();
    if (snapshot.exists) {
      return Recipe.fromMap(snapshot.value as Map<String, dynamic>);
    } else {
      throw Exception('Recipe not found');
    }
  }

  Future<List<Recipe>> getAllRecipes() async {
    DataSnapshot snapshot = await _database.ref('recipes').get();
    if (snapshot.exists && snapshot.value != null) {
      if (snapshot.value is List) {
        List<dynamic> dataList = snapshot.value as List;
        return dataList.map((data) {
          return Recipe.fromMap(Map<String, dynamic>.from(data));
        }).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<void> updateRecipe(String recipeId, Recipe updatedRecipe) async {
    await _database.ref('recipes/$recipeId').update(updatedRecipe.toMap());
  }

  // Delete a recipe
  Future<void> deleteRecipe(String recipeId) async {
    await _database.ref('recipes/$recipeId').remove();
  }

  Future<List<Recipe>> getRecipesByCategory(String category) async {
    Query query =
        _database.ref('recipes').orderByChild('category').equalTo(category);
    DataSnapshot snapshot = await query.get();
    if (snapshot.exists) {
      Map<String, dynamic> data =
          Map<String, dynamic>.from(snapshot.value as Map);
      return data.values
          .map((value) => Recipe.fromMap(Map<String, dynamic>.from(value)))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<Recipe>> searchRecipes(String searchTerm) async {
    Query query = _database
        .ref('recipes')
        .orderByChild('name')
        .startAt(searchTerm)
        .endAt('$searchTerm\uf8ff');
    DataSnapshot snapshot = await query.get();
    if (snapshot.exists) {
      Map<String, dynamic> data =
          Map<String, dynamic>.from(snapshot.value as Map);
      return data.values
          .map((value) => Recipe.fromMap(Map<String, dynamic>.from(value)))
          .toList();
    } else {
      return [];
    }
  }
}
