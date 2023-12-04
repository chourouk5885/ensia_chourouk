class Recipe {
  final String title;
  final String subtitle;
  final String kcal;
  final String expertise;
  final String time;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.title,
    required this.subtitle,
    required this.kcal,
    required this.expertise,
    required this.time,
    required this.ingredients,
    required this.instructions,
  });
}
