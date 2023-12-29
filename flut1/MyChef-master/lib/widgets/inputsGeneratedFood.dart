import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Dropdown Input'),
        ),
        body: Column(
          children: [
            CustomDropdownInput(
              initialText: 'Cook time',
              icon: Image.asset("assets/icons/timerIcon.png"),
              hint: 'Enter the time you have to cook ',
              onSelect: (text) {
                print('Selected text: $text');
              },
              additionalText: '50min',
            ),
            OptionsDropdownInput(
              initialOption: 'Option 1',
              options: ['Option 1', 'Option 2', 'Option 3'],
              onSelect: (option) {
                print('Selected option: $option');
              },
              additionalText: '',
            ),
            // Add more instances of CustomDropdownInput or OptionsDropdownInput as needed
          ],
        ),
      ),
    );
  }
}

class CustomDropdownInput extends StatefulWidget {
  final String initialText;
  final Widget icon;
  final String hint;
  final Function(String) onSelect;
  final String additionalText;

  const CustomDropdownInput({
    Key? key,
    required this.initialText,
    required this.icon,
    required this.hint,
    required this.onSelect,
    required this.additionalText,
  }) : super(key: key);

  @override
  _CustomDropdownInputState createState() => _CustomDropdownInputState();
}

class _CustomDropdownInputState extends State<CustomDropdownInput> {
  TextEditingController _textController = TextEditingController();
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _toggleDropdown,
            style: _getButtonStyle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: widget.icon,
                    ),
                    Text(
                      _getButtonText(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (MediaQuery.of(context).size.width > 600)
                      Text(
                        widget.additionalText,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    Icon(
                      _isDropdownOpen
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: const Color.fromARGB(255, 92, 90, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isDropdownOpen) _buildCustomTextField(),
        ],
      ),
    );
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  String _getButtonText() {
    return _textController.text.isEmpty ? widget.hint : _textController.text;
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: const Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildCustomTextField() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: widget.onSelect,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: widget.hint,
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsDropdownInput extends StatefulWidget {
  final String initialOption;
  final List<String> options;
  final Function(String) onSelect;
  final String additionalText;

  const OptionsDropdownInput({
    Key? key,
    required this.initialOption,
    required this.options,
    required this.onSelect,
    required this.additionalText,
  }) : super(key: key);

  @override
  _OptionsDropdownInputState createState() => _OptionsDropdownInputState();
}

class _OptionsDropdownInputState extends State<OptionsDropdownInput> {
  String _selectedOption = '';
  bool _isOptionsDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _toggleOptionsDropdown,
            style: _getButtonStyle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      _selectedOption,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.additionalText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: const Color.fromARGB(255, 92, 90, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isOptionsDropdownOpen) _buildOptionsList(),
        ],
      ),
    );
  }

  void _toggleOptionsDropdown() {
    setState(() {
      _isOptionsDropdownOpen = !_isOptionsDropdownOpen;
    });
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(30), // Increase button size
       //primary: const Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildOptionsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        children: widget.options.map((option) {
          return ListTile(
            title: Text(
              option,
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              widget.onSelect(option);
              _toggleOptionsDropdown();
            },
          );
        }).toList(),
      ),
    );
  }
}

class CustomDropdownInputNoIcon extends StatefulWidget {
  final String initialText;
  final String hint;
  final Function(String) onSelect;
  final String additionalText;

  const CustomDropdownInputNoIcon({
    Key? key,
    required this.initialText,
    required this.hint,
    required this.onSelect,
    required this.additionalText,
  }) : super(key: key);

  @override
  _CustomDropdownNoIconInputState createState() =>
      _CustomDropdownNoIconInputState();
}

class _CustomDropdownNoIconInputState extends State<CustomDropdownInputNoIcon> {
  TextEditingController _textController = TextEditingController();
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _toggleDropdown,
            style: _getButtonStyle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      _getButtonText(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (MediaQuery.of(context).size.width > 600)
                      Text(
                        widget.additionalText,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    Icon(
                      _isDropdownOpen
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: const Color.fromARGB(255, 92, 90, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isDropdownOpen) _buildCustomTextField(),
        ],
      ),
    );
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  String _getButtonText() {
    return _textController.text.isEmpty ? widget.hint : _textController.text;
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20), // Increase button size
      backgroundColor: const Color(0xFFFF9900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildCustomTextField() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: widget.onSelect,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: widget.hint,
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
