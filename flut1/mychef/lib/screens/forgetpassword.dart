import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forgot Password Screen',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonColor = Color(0xFFF57C00); // Button color - adjust as per your design

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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(child: Image.asset('assets/images/logochef.jpg')), // Corrected asset path
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Enter your email address below and we’ll send you a verification code to help you reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildTextField('Email', buttonColor),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // TODO: Implement send code functionality
                  },
                  child: Text('Send Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, Color borderColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
