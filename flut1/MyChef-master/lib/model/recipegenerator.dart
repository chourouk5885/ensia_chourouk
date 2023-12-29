import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeGenerator {
  static const String apiUrl =
      "https://api-inference.huggingface.co/models/jejun/flax-recipe-generator";
  static const String apiKey =
      "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"; // Replace with your API key

  static Future<List<String>> generateRecipe(String values) async {
    try {
      final Map<String, String> headers = {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      };

      // Pass the raw string as the payload without decoding
      final String payload = values;

      print("Request Payload: $payload");

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: payload,
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<String> outputs =
            responseData.map<String>((item) => item.toString()).toList();
        return outputs;
      } else if (response.statusCode == 503) {
        // Retry the request after a short delay
        await Future.delayed(Duration(seconds: 5));
        return generateRecipe(values);
      } else {
        throw Exception("Failed to generate recipe: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to generate recipe: $e");
    }
  }
}

void main() async {
  String values = '''
    {
      "Serves": "4",
      "CookTime": "30 minutes",
      "Ingredients": "...",
      "Tools": "...",
      "CookingLevel": "Intermediate",
      "Meal": "Dinner",
      "Disease": "None",
      "DietNote": "Vegetarian",
      "AdditionalNote": "..."
    }
  ''';

  try {
    List<String> recipeOutputs = await RecipeGenerator.generateRecipe(values);
    print("Generated Recipe: $recipeOutputs");
  } catch (e) {
    print("Error: $e");
  }
}
