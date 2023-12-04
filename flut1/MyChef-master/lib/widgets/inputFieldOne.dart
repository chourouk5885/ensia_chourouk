import 'package:flutter/material.dart';

class InputOneField extends StatefulWidget {
  final Key key;
  final String fixed1Value;
  final VoidCallback onDelete;

  InputOneField({
    required this.key,
    required this.fixed1Value,
    required this.onDelete,
  }) : super(key: key);

  @override
  _InputOneFieldState createState() => _InputOneFieldState();
}

class _InputOneFieldState extends State<InputOneField> {
  TextEditingController _dynamic1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _dynamic1Controller.text = widget.fixed1Value;

    return Row(
      key: widget.key,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _dynamic1Controller,
                decoration: InputDecoration(
                    labelText: "",
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
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 92, 90, 90))),
              )),
        ),
        SizedBox(width: 12),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: widget.onDelete,
        ),
      ],
    );
  }
}
