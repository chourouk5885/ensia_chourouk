import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mychef/screens/login.dart'; // Ensure you have this package in your pubspec.yaml

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true; // Initial value for password visibility

  @override
  Widget build(BuildContext context) {
    var borderColor =
        Color(0xFFF57C00); // Orange color for the border and button

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Signup',
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, 
              children: <Widget>[
                Image.asset('assets/images/logochef.jpg'), 
                SizedBox(height: 30),
                buildTextField('Username', borderColor),
                SizedBox(height: 15),
                buildTextField('Email', borderColor),
                SizedBox(height: 15),
                buildPasswordField('Password', borderColor),
                SizedBox(height: 15),
                buildPasswordField('Confirm Password', borderColor),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        borderColor, // Set the button color to match the screenshot
                    onPrimary: Colors.white,
                    minimumSize:
                        Size(double.infinity, 50), // Make button full width
                  ),
                  onPressed: () {},
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 20),
                Text('Use another method'),
                SizedBox(height: 20),
                buildSocialButton('Google', 'assets/images/google_icon.png',
                    Color(0xFFDD4B39)),
                SizedBox(height: 10),
                buildSocialButton('Facebook', 'assets/icons/facebook_icon.svg',
                    Color(0xFF3b5998)),
                SizedBox(height: 20),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                       'Log in',
                      style: TextStyle(
                        color: borderColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, Color borderColor) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10), // Set the border radius to 10
          borderSide:
              BorderSide(color: borderColor), // Use borderColor for the border
        ),
        enabledBorder: OutlineInputBorder(
          // Normal state border
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          // Border when TextField is selected
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }

  Widget buildPasswordField(String label, Color borderColor) {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10), // Set the border radius to 10
          borderSide:
              BorderSide(color: borderColor), // Use borderColor for the border
        ),
        enabledBorder: OutlineInputBorder(
          // Normal state border
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          // Border when TextField is selected
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }

  Widget buildSocialButton(String label, String asset, Color color) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton.icon(
      icon: label == 'Google'
          ? Image.asset(asset, height: 24.0) // For image assets
          : SvgPicture.asset(asset, height: 24.0), // For SVG assets
      label: Text(label),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: color,
        side: BorderSide(color: color, width: 1),
        minimumSize: Size(screenWidth * 0.8, 50),
        shape: RoundedRectangleBorder(
          // Add this line for rounded corners
          borderRadius: BorderRadius.circular(
              10), // Same border radius as the text fields
        ),
      ),
      onPressed: () {
        // Handle social sign-in
      },
    );
  }
}
