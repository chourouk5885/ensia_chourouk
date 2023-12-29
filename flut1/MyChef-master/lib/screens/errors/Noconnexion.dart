import 'package:flutter/material.dart';

class Noconnexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/Nocon.png', // Replace with your image asset
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16),
            Text(
              'No Network Connection',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 131, 131, 131),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                // Handle the "Try Again" button click event here
                print('Try Again clicked!');
                // Add your logic to retry the network connection or perform any action.
              },
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
