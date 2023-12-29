import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Specification',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: RecipeSpecificationScreen(),
    );
  }
}

class RecipeSpecificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonColor = Color(0xFFF57C00); // Orange color for the button

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text(
              'Recipe Specification',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Makes the body scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logochef.jpg', // Corrected asset path
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 40),
              Text(
                'You need to login to be able to use or create a template',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
               ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: buttonColor, 
    foregroundColor: Colors.white,
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
                onPressed: () {
                  // TODO: Handle login action
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                  'assets/icons/home_icon.png'), // Corrected asset path
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                  'assets/icons/save_icon.png'), // Corrected asset path
              onPressed: () {},
            ),
            SizedBox(width: 48), // The space for the floating action button.
            IconButton(
              icon: Image.asset(
                  'assets/icons/ring_icon.png'), // Corrected asset path
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                  'assets/icons/person_icon.png'), // Corrected asset path
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: Image.asset(
                'assets/icons/robot_icon.png'), // Corrected asset path
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
