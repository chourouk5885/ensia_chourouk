import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true; // Initial value for password visibility

  @override
  Widget build(BuildContext context) {
    var borderColor = Color(0xFFF57C00); // Orange color for the border and button

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Align text to the center
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top + 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.asset('assets/images/logochef.jpg'), // Your logo asset
              SizedBox(height: 30),
              buildTextField('Email', borderColor),
              SizedBox(height: 15),
              buildPasswordField('Password', borderColor),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Handle forgot password
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: borderColor, // Button color
                  onPrimary: Colors.white, // Text color
                  minimumSize: Size(double.infinity, 50), // Button size
                ),
                onPressed: () {},
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              Text('Use another method'),
              SizedBox(height: 20),
              buildSocialButton('Google', 'assets/images/google_icon.png', Color(0xFFDD4B39)),
              SizedBox(height: 10),
              buildSocialButton('Facebook', 'assets/icons/facebook_icon.svg', Color(0xFF3b5998)),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to sign up screen
                    },
                    child: Text(
                      'Sign up',
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
    );
  }
  Widget buildTextField(String label, Color borderColor) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // Set the border radius to 10
        borderSide: BorderSide(color: borderColor), // Use borderColor for the border
      ),
      enabledBorder: OutlineInputBorder( // Normal state border
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder( // Border when TextField is selected
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
        borderRadius: BorderRadius.circular(10), // Set the border radius to 10
        borderSide: BorderSide(color: borderColor), // Use borderColor for the border
      ),
      enabledBorder: OutlineInputBorder( // Normal state border
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder( // Border when TextField is selected
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
      shape: RoundedRectangleBorder( // Add this line for rounded corners
        borderRadius: BorderRadius.circular(10), // Same border radius as the text fields
      ),
    ),
    onPressed: () {
      // Handle social sign-in
    },
  );
}
}
