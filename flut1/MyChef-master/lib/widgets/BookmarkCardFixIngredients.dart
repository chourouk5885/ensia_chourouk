import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mychef/screens/recipespecification.dart';
import 'package:mychef/widgets/Recipe.dart';

class BookmarkCardFixIngredients extends StatefulWidget {
  final Recipe recipe;

  const BookmarkCardFixIngredients({
    required this.recipe,
  });

  @override
  _BookmarkCardFixIngredientsState createState() =>
      _BookmarkCardFixIngredientsState();
}

class _BookmarkCardFixIngredientsState
    extends State<BookmarkCardFixIngredients> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.recipe.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeSpecificationScreen()),
                    );
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: SvgPicture.asset(
                    isBookmarked
                        ? "assets/icons/Bookmark_duotone (1).svg"
                        : "assets/icons/Bookmark_light.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.recipe.subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/kcalIcon.svg",
                            height: 20,
                            width: 20,
                          ),
                          Text(
                            widget.recipe.kcal,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        widget.recipe.expertise,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.recipe.time,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0), // Add left padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Ingredients:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Dynamically generate instructions based on the recipe
                for (String ingredient in widget.recipe.ingredients)
                  Text(
                    '- $ingredient',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
