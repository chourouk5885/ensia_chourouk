import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mychef/screens/createTemplatePrompt/createTemplatePrompt.dart';
import 'package:mychef/screens/editTemplate/editTemplate.dart';
import 'package:mychef/screens/generateRecipeNoTemplate/multipleInputsTemplate.dart';
import 'package:mychef/screens/generateRecipeTemplate/generaterecipetemplate.dart';
import 'package:mychef/screens/generateRecipeTemplate/multipleInputs.dart';
import 'package:mychef/screens/generatereciperesult/generatereciperesult.dart';
import 'package:mychef/widgets/inputsGeneratedFood.dart';
import 'package:http/http.dart' as http;

typedef _JsonMap = Map<String, dynamic>;

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
  List<String> addedTools = [];
  List<String> addedIngredients = [];

  Map<String, dynamic> values = {
    'Serves': '', // Default value, you need to update it based on your logic
    'CookTime': '', // Default value, you need to update it based on your logic
    'Ingredients': '',
    'Tools': '',
    'CookingLevel':
        '', // Default value, you need to update it based on your logic
    'Meal': '', // Default value, you need to update it based on your logic
    'Disease': '', // Default value, you need to update it based on your logic
    'DietNote': '', // Default value, you need to update it based on your logic
    'AdditionalNote':
        '', // Default value, you need to update it based on your logic
  };

  Future<_JsonMap> generateRecipe() async {
    final apiUrl = 'https://geminifastapi.onrender.com/generate_recipe';

    final dio = Dio();

    try {
      final response = await dio.post(
        apiUrl,
        data: {
          "Serves": values["Serves"],
          "CookTime": values["CookTime"] + "min",
          "Ingredients": values["Ingredients"],
          "Tools": values["Tools"],
          "CookingLevel": values["CookingLevel"],
          "Meal": values["Meal"],
          "Disease": values["Disease"],
          "DietNote": values["DietNote"],
          "AdditionalNote": values["AdditionalNote"],
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200) {
        final result = response.data;

        // Add CookTime, Meal, and CookingLevel to the result map
        result["CookTime"] = values["CookTime"] + "min";
        result["Meal"] = values["Meal"];
        result["CookingLevel"] = values["CookingLevel"];

        print(result);
        return result;
      } else {
        print("Error generating recipe: ${response.statusCode}");
        throw Exception("Error generating recipe: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating recipe: $e");
      throw Exception("Error generating recipe: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

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
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: Colors.white,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditTemplatePrompt(),
                              ),
                            );
                            _handleUseTemplate(template);
                          },
                          child: Text(template),
                        ),
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
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text("use"),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleUseTemplate(String templateName) {
    print('Using template: $templateName');
  }

  void printAllValues() {
    Map<String, dynamic> allValues = values;
    allValues.forEach((key, value) {
      print('$key: $value');
    });
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
                values["Serves"] = value;
                print(value);
              },
              additionalText: '01',
            ),
            CustomDropdownInput(
              initialText: 'Cook time',
              icon: Image.asset('assets/icons/timerIcon.png'),
              hint: 'Enter cook time',
              onSelect: (value) {
                values["CookTime"] = value;
                print(value);
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
            MultipleInputs(
              onIngredientAdded: (ingredientValues) {
                handleIngredientAdded(ingredientValues);
              },
            ),
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
            SizedBox(height: 10.0),
            MultipleOneInputs(
              onToolAdded: (tool) {
                setState(() {
                  addedTools.add(tool);
                });
                values["Tools"] = addedTools;

                print('Added tools: $addedTools');
              },
            ),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Your cooking level',
              options: ['Newbie', 'Intermediate', 'Expert'],
              onSelect: (option) {
                print('Selected option: $option');
                values["CookingLevel"] = option;
              },
              additionalText: 'Intermediate',
            ),
            SizedBox(height: 10.0),
            OptionsDropdownInput(
              initialOption: 'Meal',
              options: ['Breakfast', 'Snack', 'Lunch', 'Dinner'],
              onSelect: (option) {
                values["Meal"] = option;

                print('Selected option: $option');
              },
              additionalText: 'Lunch',
            ),
            CustomDropdownInputNoIcon(
              initialText: 'Are you suffering from any disease?',
              hint: 'Enter your all the disease that you are suffering from',
              onSelect: (value) {
                values["Disease"] = value;
                print(value);
              },
              additionalText: '',
            ),
            CustomDropdownInput(
              initialText: 'The diet you are  following.',
              icon: Image.asset('assets/icons/HeartIcon.png'),
              hint: 'Any note we want us to take in consideration',
              onSelect: (value) {
                values["DietNote"] = value;

                print(value);
              },
              additionalText: '',
            ),
            CustomDropdownInput(
              initialText: 'Any thing you want to add :',
              icon: Image.asset('assets/icons/happy.png'),
              hint: 'The diet your are following',
              onSelect: (value) {
                values["AdditionalNote"] = value;

                print(value);
              },
              additionalText: '',
            ),
            SizedBox(height: 10.0),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final generatedRecipe = await generateRecipe();
                      print(generatedRecipe);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Generatereciperesult(
                            generatedRecipe: generatedRecipe,
                          ),
                        ),
                      );
                    } catch (e) {
                      print("Error generating recipe: $e");
                      // Handle error as needed
                    }
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

  void handleIngredientAdded(ingredientValues) {
    String ingredient =
        "${ingredientValues.fixed1Value} - ${ingredientValues.fixed2Value}";

    // Check if the ingredientValues.fixed1Value contains any haram ingredient
    if (!containsHaramIngredient(ingredientValues.fixed1Value)) {
      setState(() {
        addedIngredients.add(ingredient);
      });
      values["Ingredients"] = addedIngredients;
      print('Added ingredients: $addedIngredients');
    } else {
      print('Haram ingredient detected. Please choose a different ingredient.');
    }
  }

  bool containsHaramIngredient(String ingredient) {
    List<String> haramIngredientsList = [
      'pork',
      'alcohol',
      'gelatin',
      'bacon',
      'ham',
      'wine',
      'beer',
      'whiskey',
      'rum',
      'vodka',
      'brandy',
      'liqueur',
      'cognac',
      'sherry',
      'cider',
      'sake',
      'fermented',
      'extract',
      'vanilla extract',
      'cooking wine',
      'nylon-3',
      'riboflavin (Vitamin B2)',
      'E120 (cochineal)',
      'E441 (gelatine)',
      'E542 (bone phosphate)',
      'E904 (shellac)',
      'L-cysteine',
      'Lard',
      'Mead',
      'Blood pudding',
      'Red bull (contains taurine)',
      'L-cysteine',
      'Confectioner’s glaze',
      'Glycerol monostearate',
      'Magarine',
      'Lecithin (some sources)',
      'Milk derivatives',
      'Mono & diglycerides',
      'Natural flavorings',
      'Rennet',
      'Shellac',
      'Sodium stearoyl lactylate',
      'Vitamin D2',
      'Vitamin D3',
      'Whey',
      'Pepsin (source may be non-halal)',
      'Renin (source may be non-halal)',
      'Isinglass (derived from fish bladder)',
      'Cochineal and carmine (derived from insects)',
      'Gelatin from non-halal sources',
      'Brewer’s yeast extract (may contain alcohol)',
      'Bovine-based ingredients',
      'Honey (if contaminated with non-halal substances)',
      'Enzymes (source may be non-halal)',
      'Glycerin (if sourced from non-halal animals)',
      'Emulsifiers with non-halal sources',
      'Collagen (source may be non-halal)',
      'Tallow (animal fat)',
      'Bone char (used in sugar refining)',
      'Shellfish and their derivatives',
      'Insects and their derivatives',
      'Cross-contamination with non-halal foods',
      // Add more haram ingredients as needed
    ];

    for (String haramIngredient in haramIngredientsList) {
      if (ingredient.toLowerCase().contains(haramIngredient.toLowerCase())) {
        return true; // Haram ingredient detected
      }
    }
    return false; // No haram ingredient detected
  }
}
