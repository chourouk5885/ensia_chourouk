import 'package:flutter/material.dart';
import 'editprofile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('My profile'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Properly handle back button press
          },
        ),
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
                  backgroundImage: AssetImage('assets/images/user1.png'), // Your avatar image
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Raouf Bendi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange, // Change to your preferred orange shade
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => EditProfileScreen()),
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
          SizedBox(width: 10),
          _buildListTile(context, 'Notifications', Icons.notifications),
          _buildListTile(context, 'Privacy', Icons.lock_outline),
          Spacer(),
          _buildListTile(context, 'Terms & Conditions', Icons.description),
          _buildListTile(context, 'Report a problem', Icons.report_problem),
          Spacer(),
          _buildListTile(context, 'Help & Support', Icons.help_outline),
          _buildListTile(context, 'Log out', Icons.logout),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/home_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/save_icon.png'),
              onPressed: () {},
            ),
            SizedBox(width: 48), // The space for the floating action button.
            IconButton(
              icon: Image.asset('assets/icons/ring_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/person_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: Image.asset('assets/icons/robot_icon.png'),
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 24.0), // Adjust the icon size as needed
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
      onTap: () {
        // Handle tap
      },
    );
  }
}
