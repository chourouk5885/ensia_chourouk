import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mychef/screens/errors/Noconnexion.dart';
import 'package:mychef/screens/generateRecipeTemplate/multipleInputs.dart';
import 'package:mychef/widgets/inputsGeneratedFood.dart';
import 'package:mychef/screens/generateRecipeNoTemplate/multipleInputsTemplate.dart';

class EditTemplatePrompt extends StatefulWidget {
  @override
  _EditTemplatePromptState createState() => _EditTemplatePromptState();
}

class _EditTemplatePromptState extends State<EditTemplatePrompt> {
  final TextEditingController templateNameController = TextEditingController();
  final TextEditingController cookTimeController = TextEditingController();
  final TextEditingController cookingLevelController = TextEditingController();
  final TextEditingController dietController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController addAnythingController = TextEditingController();

  void fillWithRandomData() {
    templateNameController.text = generateRandomString();
    cookTimeController.text = generateRandomNumber().toString();
    cookingLevelController.text = generateRandomCookingLevel();
    dietController.text = generateRandomString();
    diseaseController.text = generateRandomString();
    addAnythingController.text = generateRandomString();
  }

  List<String> addedTools = [];

  String generateRandomString() {
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      10,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  int generateRandomNumber() {
    Random random = Random();
    return random
        .nextInt(100); // Assuming you want a random number between 0 and 100
  }

  String generateRandomCookingLevel() {
    const levels = ['Newbie', 'Intermediate', 'Expert'];
    Random random = Random();
    return levels[random.nextInt(levels.length)];
  }

  List<String> generateRandomOptions() {
    const options = ['Option1', 'Option2', 'Option3'];
    Random random = Random();
    return List.generate(3, (_) => options[random.nextInt(options.length)]);
  }

  @override
  Widget build(BuildContext context) {
    fillWithRandomData(); // Call this function to fill with random data

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
                controller: templateNameController,
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
              additionalText: cookTimeController.text,
            ),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Your cooking level',
              options: generateRandomOptions(),
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: cookingLevelController.text,
            ),
            CustomDropdownInput(
              initialText: 'The diet you are  following.',
              icon: Image.asset('assets/icons/HeartIcon.png'),
              hint: 'Enter your all the disease that you are suffering from',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: dietController.text,
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
              additionalText: diseaseController.text,
            ),
            SizedBox(height: 10.0),
            CustomDropdownInput(
              initialText: 'Anything you want to add : ',
              icon: Image.asset('assets/icons/happy.png'),
              hint: 'Enter something',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: addAnythingController.text,
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
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
