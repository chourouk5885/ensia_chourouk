class Recipe {
  final String author;
  final String description;
  final String difficulty; // Make sure the field name matches the JSON key
  final String dishType; // Corresponds to "dish_type" in JSON
  final String id;
  final double rating; // Ensure you handle the conversion from JSON appropriately
  final String imageUrl; // Corresponds to "image" in JSON
  final List<String> ingredients;
  final List<String>
      steps; // Ensure this is provided in the JSON or handle it being optional
  final String
      time; // Ensure this is provided in the JSON or handle it being optional
  final String subCategory; // Field names should be in camelCase
  final String name; // Ensure this matches with JSON
  final Nutrients nutrients; // Handle the nutrients data structure

  Recipe({
    required this.author,
    required this.description,
    required this.difficulty,
    required this.dishType,
    required this.id,
    required this.rating,
    required this.imageUrl,
    required this.ingredients,
    this.steps = const [],
    required this.time,
    required this.subCategory,
    required this.name,
    required this.nutrients,
  });
  @override
  String toString() {
    return 'Recipe{author: $author, name: $name, description: $description, difficulty: $difficulty, dishType: $dishType, id: $id, rating: $rating, imageUrl: $imageUrl, ingredients: $ingredients, steps: $steps, time: $time, subCategory: $subCategory, nutrients: $nutrients}';
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      difficulty: map['difficult'] ?? '', // Match JSON key
      dishType: map['dish_type'] ?? '',
      id: map['id'] ?? '',
      rating: (map['rattings'] as num?)?.toDouble() ?? 0.0,
      imageUrl: map['image'] ?? '',
      ingredients: List<String>.from(map['ingredients'] ?? []),
      // If steps and time are not part of the JSON structure, handle them accordingly
      steps: List<String>.from(map['steps'] ?? []),
      time: map['times']['Cooking'] ?? '',
      subCategory: map['subcategory'] ?? '',
      name: map['name'] ?? '',
      nutrients: Nutrients.fromMap(map['nutrients'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'description': description,
      'difficult': difficulty,
      'dish_type': dishType,
      'id': id,
      'rating': rating,
      'image': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'times': time,
      'subcategory': subCategory,
      'name': name,
      'nutrients': nutrients.toMap(),
    };
  }
}

class Nutrients {
  final String carbs;
  final String fat;
  final String fibre;
  final String kcal;
  final String protein;
  final String salt;
  final String saturates;
  final String sugars;

  Nutrients({
    required this.carbs,
    required this.fat,
    required this.fibre,
    required this.kcal,
    required this.protein,
    required this.salt,
    required this.saturates,
    required this.sugars,
  });

  factory Nutrients.fromMap(Map<String, dynamic> map) {
    return Nutrients(
      carbs: map['carbs'] ?? '',
      fat: map['fat'] ?? '',
      fibre: map['fibre'] ?? '',
      kcal: map['kcal'] ?? '',
      protein: map['protein'] ?? '',
      salt: map['salt'] ?? '',
      saturates: map['saturates'] ?? '',
      sugars: map['sugars'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carbs': carbs,
      'fat': fat,
      'fibre': fibre,
      'kcal': kcal,
      'protein': protein,
      'salt': salt,
      'saturates': saturates,
      'sugars': sugars,
    };
  }
}
