import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedApp(),
    );
  }
}

class MyTabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
          toolbarHeight: 50, // Adjust the height as needed
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // Handle back button press
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight:
                      0, // Set toolbarHeight to 0 to hide the inner AppBar
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Read',
                      ),
                      Tab(
                        text: 'Unread',
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 0.0), // Adjust padding
                    labelStyle: TextStyle(fontSize: 12), // Adjust font size
                    onTap: (index) {
                      // Handle tab click here
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Contents of Tab 1
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Vector.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'No notifications yet',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // Contents of Tab 2
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Vector.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'No notifications yet',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // Contents of Tab 3
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Vector.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'No notifications yet',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
