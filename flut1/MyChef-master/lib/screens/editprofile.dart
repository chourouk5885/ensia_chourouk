import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  int _selectedIndex = 0; // For BottomNavigationBar

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'Raouf bendi';
    _emailController.text = 'mohamed.bendi@ensia.edu.dz';
    _passwordController.text = '@lger16Alger';
    _confirmPasswordController.text = '@lger16Alger';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Implement navigation functionality here
      // Example: Navigate to the Home screen if index is 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        // AppBar background color set to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/user1.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Implement change picture functionality
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildTextField('Username', _usernameController),
            SizedBox(height: 15),
            buildTextField('Email', _emailController),
            SizedBox(height: 15),
            buildPasswordField('Password', _passwordController),
            SizedBox(height: 15),
            buildPasswordField('Confirm Password', _confirmPasswordController),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF57C00),
                onPrimary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: !_passwordVisible, // Use the _passwordVisible state here
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        // Add a suffix icon
        suffixIcon: IconButton(
          icon: Icon(
            // Change the icon based on the state of _passwordVisible
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            // Update the state to toggle password visibility
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
