import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView( // Makes the content scrollable
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/images/logochef.jpg', 
                 width: MediaQuery.of(context).size.width ,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF57C00)),
              ),
              SizedBox(height: 30),
              Text(
                'The tastiest food is waiting for you!',
                textAlign: TextAlign.center, // Center-align the text
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
