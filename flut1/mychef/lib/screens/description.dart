import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescriptionScreen extends StatelessWidget {
  final String imagePath;
  final double rating; // Assuming you want to pass this rating to the screen

  DescriptionScreen({
    required this.imagePath,
    this.rating = 4.0, // Default rating if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find best recipes for cooking',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Roasted Beef',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Dinner',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (newRating) {
                            // Handle rating update
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Roast beef is a dish of beef which is roasted in an oven. Essentially prepared as a main meal, the leftovers are often used in sandwiches and sometimes are used to make hash. In addition, a roast beef sandwich works well as a cold snack because the meat usually is cooked so that it can be sliced thinly.',
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
                        SizedBox(height: 8),
                        Text('• 1 bone-in beef rib roast (about 6 to 7 pounds)'),
                        Text('• 4 teaspoons salt (or to taste)'),
                        Text('• 2 teaspoons black pepper (or to taste)'),
                        Text('• 1 bone-in beef rib roast (about 6 to 7 pounds)'),
                        Text('• 4 teaspoons salt (or to taste)'),
                        Text('• 2 teaspoons black pepper (or to taste)'),
                        SizedBox(height: 16),
                        Text(
                          'Instructions:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('1. Preheat your oven to 325°F (165°C).'),
                        Text('2. Season the beef roast with salt and pepper.'),
                        Text('3. Place the roast on a rack in a roasting pan.'),
                        Text('4. Preheat your oven to 325°F (165°C).'),
                        Text('5. Season the beef roast with salt and pepper.'),
                        Text('6. Place the roast on a rack in a roasting pan.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
