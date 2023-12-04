import 'package:flutter/material.dart';
import 'dart:math';

class NotificationItem {
  final String message;
  final String paragraph;
  final DateTime date;

  NotificationItem(this.message, this.paragraph, this.date);

  factory NotificationItem.random(DateTime date) {
    final Random random = Random();
    final int randomNumber = random.nextInt(1000);
    return NotificationItem(
      'Notification $randomNumber',
      'This is a short paragraph about something interesting.',
      date,
    );
  }
}

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _selectedIndex = 0;

  final List<NotificationItem> allNotifications = [
    NotificationItem.random(DateTime.now().subtract(Duration(days: 2))),
    NotificationItem.random(DateTime.now().subtract(Duration(days: 1))),
    // Add more notifications for the 'All' tab
  ];

  final List<NotificationItem> readNotifications = [
    NotificationItem.random(DateTime.now().subtract(Duration(days: 3))),
    NotificationItem.random(DateTime.now().subtract(Duration(days: 5))),
    // Add more notifications for the 'Read' tab
  ];

  final List<NotificationItem> unreadNotifications = [
    NotificationItem.random(DateTime.now().subtract(Duration(days: 1))),
    NotificationItem.random(DateTime.now().subtract(Duration(days: 4))),
    // Add more notifications for the 'Unread' tab
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 50,
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: 0,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: TabBar(
                    tabs: [
                      buildTab('All', _selectedIndex == 0),
                      buildTab('Read', _selectedIndex == 1),
                      buildTab('Unread', _selectedIndex == 2),
                    ],
                    indicatorColor:
                        Colors.transparent, // Set this to transparent
                    onTap: (index) {
                      // Handle tab click here
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildTabContent(allNotifications, Icons.notifications),
            buildTabContent(readNotifications, Icons.mail),
            buildTabContent(
                unreadNotifications, Icons.mark_email_unread_rounded),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(
      List<NotificationItem> notifications, IconData iconData) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        DateTime now = DateTime.now();
        DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

        String headerText = '';

        if (notification.date
            .toLocal()
            .isAfter(now.subtract(Duration(days: 1)))) {
          headerText = 'Today';
        } else if (notification.date
            .toLocal()
            .isAfter(yesterday.subtract(Duration(days: 1)))) {
          headerText = 'Yesterday';
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (headerText.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  headerText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
              ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 223, 223),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        iconData,
                        size: 20,
                        color: Color.fromARGB(255, 128, 128, 128),
                      ),
                      SizedBox(width: 8),
                      Text(
                        notification.message,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 160, 160, 160),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    notification.paragraph,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Date: ${notification.date.toLocal()}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTab(String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.orange : Colors.white,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
