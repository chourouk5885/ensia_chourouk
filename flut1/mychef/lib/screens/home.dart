import 'package:flutter/material.dart';
import 'description.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  String selectedCategory = 'Breakfast';
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final PageController _secondPageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/food1.jpeg',
      'assets/images/food2.jpeg',
      'assets/images/food3.jpeg',
      'assets/images/food1.jpeg',
      'assets/images/food2.jpeg',
      'assets/images/food3.jpeg',
      // Add more image paths as needed
    ];
      
    return Scaffold(
      appBar: AppBar(
  title: Align(
    alignment: Alignment.topLeft,
    child: Text(
      'Find best recipes for cooking',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  backgroundColor: Colors.white,
  elevation: 0,
),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
              child: Text(
                'Popular categories',
                style: TextStyle(
                  fontSize: 22, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the color to black
                ),
              ),
            ),
            Wrap(
  spacing: 7.0, // space between chips
  children: ['Lunch', 'Breakfast', 'Snack', 'Dinner']
    .map((category) => _buildCategoryChip(category))
    .toList(),
),

               SizedBox(height: 20),
                 Container(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                pageSnapping: false,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 250,
                          width: Curves.easeOut.transform(value) * MediaQuery.of(context).size.width * 0.6,
                          child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DescriptionScreen(imagePath: imagePaths[index]),
    ));
                      },
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
             //SizedBox(height: 20),
                 Container(
              height: 300,
              child: PageView.builder(
                controller: _secondPageController,
                pageSnapping: false,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _secondPageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_secondPageController.position.haveDimensions) {
                        value = _secondPageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 250,
                          width: Curves.easeOut.transform(value) * MediaQuery.of(context).size.width * 0.6,
                          child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DescriptionScreen(imagePath: imagePaths[index]),
    ));
                      },
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
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
Widget _buildCategoryChip(String label) {
  bool isSelected = (selectedCategory == label);

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 4 - 10, 
        child: ChoiceChip(
          label: Text(
            label,
            textAlign: TextAlign.center, 
            style: TextStyle(
              color: isSelected ? Colors.white : Color.fromARGB(99, 57, 56, 56),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              selectedCategory = label;
            });
          },
          backgroundColor: Colors.white,
          selectedColor: Colors.orange,
          elevation: 0,
          pressElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: isSelected ? Colors.orange : Colors.white!),
          ),
          checkmarkColor: Colors.transparent,
          showCheckmark: false, 
        ),
      );
    },
  );
}

}
class DetailScreen extends StatelessWidget {
  final String imagePath;

  DetailScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}