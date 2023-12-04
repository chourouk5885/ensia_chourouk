import 'package:flutter/material.dart';
import 'description.dart';


class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> imagePaths = [
    'assets/images/food1.jpeg',
    'assets/images/food2.jpeg',
    'assets/images/food3.jpeg',
    'assets/images/food1.jpeg',
    'assets/images/food2.jpeg',
    'assets/images/food3.jpeg',
    // Add more image paths as needed
  ];

  late TabController _tabController;

  Color breakfastTabColor =
      const Color.fromARGB(255, 93, 92, 92); // Initial color for Breakfast
  Color snackTabColor =
      const Color.fromARGB(255, 93, 92, 92); // Initial color for Snack

  bool breakfastTabClicked = false;
  bool snackTabClicked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      // Update tab colors when a tab is clicked
      updateTabColors();
    });
  }

  // Update tab colors based on which tab is clicked
  void updateTabColors() {
    setState(() {
      breakfastTabColor = breakfastTabClicked
          ? Colors.blue
          : const Color.fromARGB(255, 93, 92, 92);
      snackTabColor =
          snackTabClicked ? Colors.red : const Color.fromARGB(255, 93, 92, 92);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Find best recipes for cooking',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Popular categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.orange,
              ),
              tabs: [
                _buildCategoryTab('Lunch', 0),
                _buildCategoryTab('Breakfast', 1),
                _buildCategoryTab('Snack', 2),
                _buildCategoryTab('Dinner', 3),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.6, // Adjust this as needed
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildImagePageView(0),
                _buildImagePageView(1),
                _buildImagePageView(2),
                _buildImagePageView(3),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildCategoryTab(String label, int index) {
    bool isSelected = _tabController.index == index;

    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : label == 'Breakfast'
                    ? breakfastTabColor
                    : label == 'Snack'
                        ? snackTabColor
                        : const Color.fromARGB(255, 93, 92, 92),
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void updateBreakfastTabColor() {
    setState(() {
      // Update breakfastTabClicked based on your logic
      breakfastTabClicked = true; // For example, set it to true when clicked
      updateTabColors(); // Update colors immediately
    });
  }

  void updateSnackTabColor() {
    setState(() {
      // Update snackTabClicked based on your logic
      snackTabClicked = true; // For example, set it to true when clicked
      updateTabColors(); // Update colors immediately
    });
  }

 Widget _buildImagePageView(int categoryIndex) {
  final PageController _pageController1 = PageController(viewportFraction: 0.6);
  final PageController _pageController2 = PageController(viewportFraction: 0.6);

  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 300, // Set a fixed height for the containers
          child: PageView.builder(
            controller: _pageController1,
            pageSnapping: false,
            itemCount: imagePaths.length, 
            itemBuilder: (context, index) {
              return _buildAnimatedImage(index, _pageController1, context);
            },
          ),
        ),
        Container(
          height: 300, // Set a fixed height for the containers
          child: PageView.builder(
            controller: _pageController2,
            pageSnapping: false,
            itemCount: imagePaths.length, 
            itemBuilder: (context, index) {
              return _buildAnimatedImage(index, _pageController2, context);
            },
          ),
        ),
      ],
    ),
  );
}


Widget _buildAnimatedImage(
    int index, PageController controller, BuildContext context) {
  return AnimatedBuilder(
    animation: controller,
    builder: (context, child) {
      double value = 1.0;
      if (controller.position.haveDimensions) {
        value = controller.page! - index;
        value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
      }
      return Center(
        child: SizedBox(
          height: Curves.easeOut.transform(value) * 250,
          width: Curves.easeOut.transform(value) *
              MediaQuery.of(context).size.width *
              0.6,
          child: child,
        ),
      );
    },
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              DescriptionScreen(imagePath: imagePaths[index]),
        ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
} 
}