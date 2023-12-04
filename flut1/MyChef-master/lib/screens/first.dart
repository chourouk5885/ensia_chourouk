import 'package:flutter/material.dart';
import 'package:mychef/screens/theHome.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center( // Center the main content
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logochef.jpg',
                    width: screenSize.width * 0.8, // Responsive image width
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20), // Spacing after image
                  Text(
                    'Let the AI',
                    style: TextStyle(
                      fontSize: 24, // Fixed font size for consistency
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'generate',
                    style: TextStyle(
                      fontSize: 24, // Fixed font size
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'your recipes',
                    style: TextStyle(
                      fontSize: 24, // Fixed font size
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 30), // Spacing before button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScreenHolder()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Make the button orange
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start Cooking',
                          style: TextStyle(
                            fontSize: 18, // Fixed font size for button text
                          ),
                        ),
                        SizedBox(width: 10), // Space between text and icon
                        Icon(
                          Icons.arrow_forward, // Arrow icon
                          color: Colors.white, // Icon color
                          size: 24, // Icon size
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Spacing after button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}