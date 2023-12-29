import 'package:flutter/material.dart';
import '../../widgets/fixedField.dart';
import '../../widgets/inputField.dart';

class MultipleInputs extends StatefulWidget {
  final Function(FixedFieldValues) onIngredientAdded;

  MultipleInputs({required this.onIngredientAdded});

  @override
  _MultipleInputsState createState() => _MultipleInputsState();
}

class _MultipleInputsState extends State<MultipleInputs> {
  final GlobalKey<FixedFieldState> fixedKey = GlobalKey<FixedFieldState>();
  final List<InputField> inputFields = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Row(
              children: [
                SizedBox(width: 12),
              ],
            ),
            ...inputFields,
            FixedField(
              key: fixedKey,
              onAddField: addField,
              fixed1LabelText: 'Item name',
              fixed2LabelText: 'Quantity',
            ),
          ],
        ),
      ],
    );
  }

  void addField(FixedFieldValues fixedValues) {
    final newKey = UniqueKey();
    setState(() {
      inputFields.insert(
        0,
        InputField(
          key: newKey,
          fixed1Value: fixedValues.fixed1Value,
          fixed2Value: fixedValues.fixed2Value,
          onDelete: () => removeField(newKey),
        ),
      );

      // Call the callback function with the added ingredient values
      widget.onIngredientAdded(fixedValues);
    });
  }

  void removeField(Key key) {
    setState(() {
      inputFields.removeWhere((field) => field.key == key);
    });
  }
}
