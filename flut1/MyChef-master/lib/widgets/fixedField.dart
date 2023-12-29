import 'package:flutter/material.dart';

class FixedFieldValues {
  final String fixed1Value;
  final String fixed2Value;

  FixedFieldValues({
    required this.fixed1Value,
    required this.fixed2Value,
  });
}

class FixedField extends StatefulWidget {
  final Key? key;
  final ValueChanged<FixedFieldValues> onAddField;
  final String fixed1LabelText;
  final String fixed2LabelText;

  FixedField({
    this.key,
    required this.onAddField,
    required this.fixed1LabelText,
    required this.fixed2LabelText,
  });

  @override
  State<FixedField> createState() => FixedFieldState();
}

class FixedFieldState extends State<FixedField> {
  TextEditingController _fixed1Controller = TextEditingController();
  TextEditingController _fixed2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _fixed1Controller,
              decoration: InputDecoration(
                  labelText: widget.fixed1LabelText,
                  filled: true,
                  fillColor: Colors.grey[200], // Set to grey
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(
                            0xFFFF9900)), // Set to the desired color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[200]!), // Set to the desired color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 92, 90, 90))),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _fixed2Controller,
              decoration: InputDecoration(
                  labelText: widget.fixed2LabelText,
                  filled: true,
                  fillColor: Colors.grey[200], // Set to grey
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(
                            0xFFFF9900)), // Set to the desired color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[200]!), // Set to the desired color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 92, 90, 90))),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            widget.onAddField(FixedFieldValues(
              fixed1Value: _fixed1Controller.text,
              fixed2Value: _fixed2Controller.text,
            ));
            _fixed1Controller.clear();
            _fixed2Controller.clear();
          },
        ),
      ],
    );
  }
}
