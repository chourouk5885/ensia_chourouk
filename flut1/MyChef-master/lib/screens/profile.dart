import 'package:flutter/material.dart';
import 'editprofile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        // AppBar background color set to white
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/images/user1.png'), // Your avatar image
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Raouf Bendi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color:
                        Colors.orange, // Change to your preferred orange shade
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()),
                      );
                    },
                    child: Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
         Divider(), // Add a divider between the profile and list items
          _buildListTile(context, 'Notifications', Icons.notifications),
          _buildListTile(context, 'Privacy', Icons.lock_outline),
          _buildListTile(context, 'Terms & Conditions', Icons.description),
          _buildListTile(context, 'Report a problem', Icons.report_problem),
          _buildListTile(context, 'Help & Support', Icons.help_outline),
          _buildListTile(context, 'Log out', Icons.logout),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 24.0, color: Colors.black), // Icon color set to black
      title: Text(title, style: TextStyle(color: Colors.black)), // Text color set to black
      trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.black), // Trailing icon color
      onTap: () {
        // Handle tap actions
      },
    );
  }
}