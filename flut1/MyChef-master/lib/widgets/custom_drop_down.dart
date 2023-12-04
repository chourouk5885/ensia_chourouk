import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mychef/widgets/Recipe.dart';

class BookmarkCard extends StatefulWidget {
  final Recipe recipe;

  const BookmarkCard({
    required this.recipe,
  });

  @override
  _BookmarkCardState createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ExpansionTile(
        iconColor: Colors.white,
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
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              child: SvgPicture.asset(
                isBookmarked
                    ? "assets/icons/Bookmark_light.svg"
                    : "assets/icons/Bookmark_duotone (1).svg",
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.recipe.subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
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
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.recipe.expertise,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.recipe.time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Container(
            color: Colors.grey[300], // Set the background color of the expanded part to gray
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients:',
                  style: TextStyle(
                    color: Colors.black, // Changed text color for better contrast with gray background
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Dynamically generate ingredients based on the recipe
                for (String ingredient in widget.recipe.ingredients)
                  Text(
                    '- $ingredient',
                    style: TextStyle(
                      color: Colors.black, // Adjusted for better readability
                      fontSize: 14,
                    ),
                  ),
                SizedBox(height: 16),
                Text(
                  'Instructions:',
                  style: TextStyle(
                    color: Colors.black, // Adjusted for better readability
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
                      color: Colors.black, // Adjusted for better readability
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

