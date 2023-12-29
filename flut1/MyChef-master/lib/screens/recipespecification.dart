import 'package:flutter/material.dart';
import 'package:mychef/screens/login.dart';

class RecipeSpecificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonColor = Color(0xFFF57C00); // Orange color for the button

    return Scaffold(
      appBar:   AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Recipe specification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        // AppBar background color set to white
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // This makes the body scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/logochef.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You need to login to be able to save the recipes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: buttonColor, // Updated from 'primary'
    foregroundColor: Colors.white, // Updated from 'onPrimary'
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
                onPressed: () {
                  // Navigate to LoginScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
