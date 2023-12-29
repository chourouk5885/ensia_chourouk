import 'package:flutter/material.dart';
import '../../widgets/fixedFieldOne.dart';
import '../../widgets/inputFieldOne.dart';

class MultipleOneInputs extends StatefulWidget {
  final Function(String) onToolAdded;

  const MultipleOneInputs({Key? key, required this.onToolAdded})
      : super(key: key);

  @override
  _MultipleOneInputsState createState() => _MultipleOneInputsState();
}

class _MultipleOneInputsState extends State<MultipleOneInputs> {
  final GlobalKey<FixedOneFieldState> fixedKey =
      GlobalKey<FixedOneFieldState>();
  final List<InputOneField> inputFields = [];

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
            FixedOneField(
              key: fixedKey,
              onAddField: addField,
              fixedLabelText: 'Item name',
            ),
          ],
        ),
      ],
    );
  }

  void addField(FixedOneFieldValues fixedValues) {
    final newKey = UniqueKey();
    widget.onToolAdded(fixedValues.fixedValue);
    setState(() {
      inputFields.insert(
        0,
        InputOneField(
          key: newKey,
          fixed1Value: fixedValues.fixedValue,
          onDelete: () {
            removeField(newKey);
            print('Tool removed: ${fixedValues.fixedValue}');
          },
        ),
      );
    });
  }

  void removeField(Key key) {
    setState(() {
      inputFields.removeWhere((field) => field.key == key);
    });
  }
}
