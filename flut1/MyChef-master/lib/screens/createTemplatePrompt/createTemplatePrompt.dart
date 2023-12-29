import 'package:flutter/material.dart';
import 'package:mychef/screens/errors/Noconnexion.dart';
import 'package:mychef/screens/generateRecipeTemplate/multipleInputs.dart';

import 'package:mychef/widgets/inputsGeneratedFood.dart';
import 'package:mychef/screens/generateRecipeNoTemplate/multipleInputsTemplate.dart';

class CreateTemplatePrompt extends StatefulWidget {
  @override
  _CreateTemplatePromptState createState() => _CreateTemplatePromptState();
}

class _CreateTemplatePromptState extends State<CreateTemplatePrompt> {
  List<String> addedTools = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Template name:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter template name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFFF9900),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            CustomDropdownInput(
              initialText: 'Serves',
              icon: Image.asset('assets/icons/profileIconNotSelected.png'),
              hint: 'Enter cook time',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '01',
            ),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Your cooking level',
              options: ['Newbie', 'Intermediate', 'Expert'],
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: 'Intermediate',
            ),
            CustomDropdownInput(
              initialText: 'The diet you are  following.',
              icon: Image.asset('assets/icons/HeartIcon.png'),
              hint: 'Enter your all the disease that you are suffering from',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '',
            ),
            ListTile(
              title: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            MultipleOneInputs(
              onToolAdded: (tool) {
                setState(() {
                  addedTools.add(tool);
                });
                print('Added tools: $addedTools');
              },
            ),
            SizedBox(height: 10.0),
            CustomDropdownInputNoIcon(
              initialText: 'Are you suffering from any disease?',
              hint: 'Enter your all the disease that you are suffering from',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '',
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
                        builder: (context) => Noconnexion(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF9900),
                    foregroundColor: Colors.white,
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
