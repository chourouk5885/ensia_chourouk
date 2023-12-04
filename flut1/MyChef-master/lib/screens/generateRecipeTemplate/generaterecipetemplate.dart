import 'package:flutter/material.dart';
import 'package:mychef/screens/generatereciperesult/generatereciperesult.dart';

import 'package:mychef/widgets/inputsGeneratedFood.dart';
import 'package:mychef/screens/generateRecipeTemplate/multipleInputs.dart';

class Generaterecipetemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Generate recipe',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          // AppBar background color set to white
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CustomDropdownInput(
              initialText: 'Cook time',
              icon: Image.asset('assets/icons/timerIcon.png'),
              hint: 'Enter cook time',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '50 min',
            ),
            ListTile(
              title: Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            MultipleInputs(),
            OptionsDropdownInput(
              initialOption: 'Meal',
              options: ['Breakfast', 'Snack', 'Lunch', 'Dinner'],
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: 'Lunch',
            ),
            SizedBox(height: 10.0),
            CustomDropdownInput(
              initialText: 'Anything you want to add : ',
              icon: Image.asset('assets/icons/happy.png'),
              hint: 'Enter something',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '',
            ),
            SizedBox(height: 10.0),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Generatereciperesult(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF9900),
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text('Generate Recipe'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
