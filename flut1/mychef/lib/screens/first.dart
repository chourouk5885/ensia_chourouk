import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Adjust as needed
      ),
      home: FirstPage(), // Set FirstPage as the home screen
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth > 600 ? 32.0 : 16.0;
    double fontSize = screenWidth > 600 ? 48.0 : 36.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/images/chef.jpeg', // Corrected asset path
                  width: screenWidth,
                  height: screenWidth / 1.2,
                  fit: BoxFit.cover, // Ensure the image covers the entire space
                ),
                SizedBox(height: padding),
                Text(
                  'Let the AI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color as black
                  ),
                ),
                Text(
                  'generate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.black, // Text color as black
                  ),
                ),
                Text(
                  'your recipes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.black, // Text color as black
                  ),
                ),
                if (screenHeight > screenWidth) Expanded(child: Container()), // Conditional Expanded
                ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward),
                  label: Text(
                    'Start Cooking',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 24.0 : 20.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(300, 50),
                  ),
                ),
                SizedBox(height: padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
