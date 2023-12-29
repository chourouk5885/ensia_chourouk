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
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFF9900),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.recipe.Meal ?? 'Meal Not Found',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth > 600 ? 22 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeSpecificationScreen(),
                          ),
                        );
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      child: SvgPicture.asset(
                        isBookmarked
                            ? "assets/icons/Bookmark_duotone (1).svg"
                            : "assets/icons/Bookmark_light.svg",
                        height: screenWidth > 600 ? 32 : 24,
                        width: screenWidth > 600 ? 32 : 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 32 : 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            widget.recipe.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth > 600 ? 26 : 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/kcalIcon.svg",
                                height: screenWidth > 600 ? 32 : 24,
                                width: screenWidth > 600 ? 32 : 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                widget.recipe.kcal,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth > 600 ? 22 : 18,
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
                              fontSize: screenWidth > 600 ? 22 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.recipe.time,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth > 600 ? 22 : 18,
                              fontWeight: FontWeight.bold,
                            ),
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            color: Color(0xFFAAAAAA),
          ),
          padding: EdgeInsets.all(screenWidth > 600 ? 26 : 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instructions:',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: screenWidth > 600 ? 26 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.recipe.instructions,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: screenWidth > 600 ? 20 : 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
