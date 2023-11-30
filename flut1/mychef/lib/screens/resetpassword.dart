import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create New Password',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.white, // Sets the AppBar background color to white
          iconTheme: IconThemeData(color: Colors.black), // Sets the AppBar icon color to black
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: CreateNewPasswordScreen(),
    );
  }
}

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}




class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var borderColor = Color(0xFFF57C00);

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Code Verification',
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Image.asset('assets/images/logochef.jpg'), // Correct asset path
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Your new password must be unique from those previously used.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0, // Larger font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildPasswordField('Password', borderColor),
              SizedBox(height: 15),
              buildPasswordField('Confirm Password', borderColor),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: borderColor,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Implement reset password functionality
                },
                child: Text('Reset password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(String label, Color borderColor) {
    return TextField(
      obscureText: label == 'Password' ? _obscurePassword : _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            label == 'Password' && _obscurePassword || label == 'Confirm Password' && _obscureConfirmPassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              if (label == 'Password') {
                _obscurePassword = !_obscurePassword;
              } else {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              }
            });
          },
        ),
      ),
    );
  }
}
