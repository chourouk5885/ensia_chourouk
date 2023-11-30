import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Verification',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CodeVerificationScreen(),
    );
  }
}


class CodeVerificationScreen extends StatelessWidget {
  final Color borderColor = Color(0xFFF57C00); // Define borderColor here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView( // This makes the screen scrollable
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logochef.jpg'), // Corrected asset path
              SizedBox(height: 40),
              Text(
                'Enter the verification code we just sent on your email address.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => buildCodeBox(context, borderColor)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: borderColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Implement verify code functionality
                },
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCodeBox(BuildContext context, Color borderColor) {
    return Container(
      width: 60,
      height: 60, // Ensure boxes are square
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
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
