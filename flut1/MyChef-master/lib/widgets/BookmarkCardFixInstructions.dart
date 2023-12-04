import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mychef/screens/recipespecification.dart';
import 'package:mychef/widgets/Recipe.dart';

class BookmarkCardFixInstructions extends StatefulWidget {
  final Recipe recipe;

  const BookmarkCardFixInstructions({
    required this.recipe,
  });

  @override
  _BookmarkCardFixInstructions createState() => _BookmarkCardFixInstructions();
}

class _BookmarkCardFixInstructions extends State<BookmarkCardFixInstructions> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
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
                          SizedBox(width: 8),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Dynamically generate instructions based on the recipe
                for (String instruction in widget.recipe.instructions)
                  Text(
                    instruction,
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
