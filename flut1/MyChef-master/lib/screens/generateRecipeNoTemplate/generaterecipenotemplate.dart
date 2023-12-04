import 'package:flutter/material.dart';
import 'package:mychef/screens/createTemplatePrompt/createTemplatePrompt.dart';
import 'package:mychef/screens/generateRecipeTemplate/generaterecipetemplate.dart';
import 'package:mychef/screens/generateRecipeTemplate/multipleInputs.dart';
import 'package:mychef/screens/generatereciperesult/generatereciperesult.dart';
import 'package:mychef/widgets/inputsGeneratedFood.dart';
import 'package:mychef/screens/generateRecipeNoTemplate/multipleInputsTemplate.dart';

class Generaterecipenotemplate extends StatefulWidget {
  @override
  _GeneraterecipenotemplateState createState() =>
      _GeneraterecipenotemplateState();
}

class _GeneraterecipenotemplateState extends State<Generaterecipenotemplate>
    with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFirstTimeOpened = true;

  List<String> templates = ['Template 1', 'Template 2', 'Template 3'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    // Delay the bottom sheet display until the widget is fully built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (isFirstTimeOpened) {
        _showBottomSheet(context);
        isFirstTimeOpened = false;
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose a Template:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 140.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateTemplatePrompt(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("+"),
                ),
              ]),
              SizedBox(height: 16.0),
              Column(
                children: [
                  for (String template in templates)
                    Row(
                      children: [
                        // Adjust the spacing between the button and the template name
                        Text(template),
                        SizedBox(width: 220.0),
                        SizedBox(height: 40.0),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Generaterecipetemplate(),
                              ),
                            );
                            _handleUseTemplate(template);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text("use"),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleUseTemplate(String templateName) {
    // Implement your logic here based on the selected template
    print('Using template: $templateName');
    // You can set state variables, navigate to a new screen, etc.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipe Generator'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CustomDropdownInput(
              initialText: 'Serves',
              icon: Image.asset('assets/icons/profileIconNotSelected.png'),
              hint: 'Enter cook time',
              onSelect: (value) {
                // Do something with selected value
              },
              additionalText: '01',
            ),
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
            SizedBox(height: 10.0),
            MultipleInputs(),
            SizedBox(height: 10.0),
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
            MultipleOneInputs(),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Your cooking /n level',
              options: ['Newbie', 'Intermediate', 'Expert'],
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: 'Intermediate',
            ),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Meal',
              options: ['Breakfast', 'Snack', 'Lunch', 'Dinner'],
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: 'Lunch',
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
              initialText: 'The diet you are  following.',
              icon: Image.asset('assets/icons/HeartIcon.png'),
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
