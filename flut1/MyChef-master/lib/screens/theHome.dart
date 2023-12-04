import 'package:flutter/material.dart';
import 'package:mychef/screens/Notifications.dart';
import 'package:mychef/screens/description.dart';
import 'package:mychef/screens/displayBookedRecipe/displayBookedrecipe.dart';
import 'package:mychef/screens/generateRecipeNoTemplate/generaterecipenotemplate.dart';
import 'package:mychef/screens/home.dart';
import 'package:mychef/screens/profile.dart';

class ScreenHolder extends StatefulWidget {
  @override
  _ScreenHolder createState() => _ScreenHolder();
}

class _ScreenHolder extends State<ScreenHolder> {
  int currentTab = 0; // to keep track of active tab index
  List<Widget> _screens = [
    RecipeScreen(),
    DisplayBookedrecipe(),
    Generaterecipenotemplate(),
    Notifications(),
    ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      currentTab = index;
    });
  }

  void _onItemTapped(int selected) {
    if (selected == 2) {
      // Handle the case when the floating action button is pressed
      setState(() {
        currentTab = 2;
        _pageController
            .jumpToPage(2); // Go to the "Generate Recipe No Template" screen
      });
    } else {
      setState(() {
        currentTab = selected;
        _pageController.jumpToPage(selected);
      });
    }
  }

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          'assets/icons/robotIconNotSelected.png',
          color: currentTab == 2
              ? Colors.orange
              : const Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          // Handle the onPressed event for the floating action button
          _onItemTapped(2);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavItem(0, 'assets/icons/homeIconNotSelected.png'),
              buildNavItem(1, 'assets/icons/favoriteIconNotSelected.png'),
              SizedBox(width: 20),
              buildNavItem(3, 'assets/icons/notificationIconSelected.png'),
              buildNavItem(4, 'assets/icons/profileIconNotSelected.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String iconPath) {
    return MaterialButton(
      minWidth: 80,
      onPressed: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              iconPath,
              color: currentTab == index ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
