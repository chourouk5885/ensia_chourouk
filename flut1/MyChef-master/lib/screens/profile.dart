import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyChef',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent, // Use `secondary` for accent color
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingsScreen(),
    );
  }
}


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // General Section
          _buildSectionHeader('GENERAL'),
          _buildSwitchListTile(
            title: 'Notifications',
            iconData: Icons.notifications_none,
            value: isNotificationsEnabled,
            onChanged: (newValue) {
              setState(() {
                isNotificationsEnabled = newValue;
              });
            },
          ),
          // Other items...
          _buildListTile(
            title: 'About MyChef',
            iconData: Icons.info_outline,
            onTap: () => _navigateToAbout(context),
          ),
          _buildListTile(
            title: 'Terms and Conditions',
            iconData: Icons.description_outlined,
            onTap: () => _navigateToTerms(context),
          ),
          // Feedback Section
          _buildSectionHeader('FEEDBACK'),
          _buildListTile(
            title: 'Send feedback',
            iconData: Icons.feedback_outlined,
            onTap: _sendFeedbackEmail,
          ),
        ],
      ),
    );
  }

  Padding _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  SwitchListTile _buildSwitchListTile({
    required String title,
    required IconData iconData,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      secondary: Icon(iconData, color: Colors.orange),
      activeColor: Colors.orange,
      value: value,
      onChanged: onChanged,
    );
  }

  ListTile _buildListTile({
    required String title,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(iconData, color: Colors.orange),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
  }

  void _navigateToTerms(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsScreen()));
  }

  void _sendFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@mychefapp.com', // Replace with actual email address
      query: 'subject=Feedback for MyChef App',
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not launch email client'),
      ));
    }
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About MyChef', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is MyChef?',
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'MyChef is an AI-powered app designed to revolutionize the way we think about home cooking. By providing personalized recipes based on available ingredients, MyChef helps to reduce food waste and simplifies meal planning.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Mission',
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'To empower individuals by providing them with smart, personalized cooking experiences that are both sustainable and enjoyable.',
              style: TextStyle(fontSize: 16),
            ),
            // Consider adding more content and sections as needed
          ],
        ),
      ),
    );
  }
}

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Use',
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to MyChef! By accessing our app, you agree to these terms and conditions. Please read them carefully.',
              style: TextStyle(fontSize: 16),
            ),
            // Include your terms text here. Consider using an ExpansionTile to organize sections.
            // ...
          ],
        ),
      ),
    );
  }
}


