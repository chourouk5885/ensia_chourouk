
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
    // Fetch the screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Ensures the screen is scrollable
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height, // Ensures the container takes at least the full height of the screen
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logochef.jpg', // Correct the asset path
                  width: screenSize.width * 0.5, // 80% of the screen width
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 30),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF57C00)),
                ),
                SizedBox(height: 30),
                Text(
                  'Are you excited to make the AI suggest food for you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Makes the text bolder
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
