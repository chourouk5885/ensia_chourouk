import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/recipe.dart';

class DescriptionScreen extends StatelessWidget {
  final Recipe recipe;

  DescriptionScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize
              .min, // Use min to limit the column size to its children
          children: [
            Flexible(
              child: Text(
                recipe.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow
                    .ellipsis, // Use ellipsis for text that doesn't fit
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
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
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "By ${recipe.author}",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      _InfoBox(
                        icon: Icons.category,
                        text: recipe.subCategory.toUpperCase(),
                        backgroundColor: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Insert _InfoBox widgets here for Time and Difficulty
                  Wrap(
                    spacing: 10, // space between boxes
                    children: [
                      _InfoBox(
                        icon: Icons.timer,
                        text: recipe.time,
                        backgroundColor: Colors.yellow.shade700,
                      ),
                      _InfoBox(
                        icon: Icons.bar_chart,
                        text: recipe.difficulty,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  RatingBarIndicator(
                    rating: recipe.rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(height: 16),
                  Text(
                    recipe.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ...recipe.ingredients
                      .map((ingredient) => Text('• $ingredient'))
                      .toList(),
                  SizedBox(height: 16),
                  Text(
                    'Steps:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ...recipe.steps.map((step) => Text('• $step')).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;

  const _InfoBox({
    Key? key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      // This will size the width to the width of the widest item
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Width fits to content
          children: [
            Icon(icon, color: Colors.white, size: 16),
            SizedBox(width: 8.0),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
