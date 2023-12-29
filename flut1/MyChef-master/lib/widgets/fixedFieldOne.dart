import 'package:flutter/material.dart';

class FixedOneFieldValues {
  final String fixedValue;

  FixedOneFieldValues({
    required this.fixedValue,
  });
}

class FixedOneField extends StatefulWidget {
  final Key? key;
  final ValueChanged<FixedOneFieldValues> onAddField;
  final String fixedLabelText;

  FixedOneField({
    this.key,
    required this.onAddField,
    required this.fixedLabelText,
  });

  @override
  State<FixedOneField> createState() => FixedOneFieldState();
}

class FixedOneFieldState extends State<FixedOneField> {
  TextEditingController _fixed1Controller = TextEditingController();

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
                  labelText: widget.fixedLabelText,
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
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            widget.onAddField(FixedOneFieldValues(
              fixedValue: _fixed1Controller.text,
            ));
            _fixed1Controller.clear();
          },
        ),
      ],
    );
  }
}
