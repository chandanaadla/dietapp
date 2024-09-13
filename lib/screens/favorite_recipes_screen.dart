import 'package:flutter/material.dart';


class FavoriteRecipesScreen extends StatefulWidget {
  @override
  _FavoriteRecipesScreenState createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Space from the top
            Center(
              child: Text(
                'Recipes',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tab Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  _buildTabButton('Food', 0, Colors.black, Colors.orange),
                  _buildTabButton('Recipes', 1, Colors.white, Colors.red),
                ],
              ),
            ),

            SizedBox(height: 20),

            // List of Recipes
            Expanded(
              child: ListView(
                children: [
                  _buildRecipeCard('Chopped Spring Ramen', '250 Kcal', 'Scallions & tomatoes'),
                  SizedBox(height: 20),
                  _buildRecipeCard('Chicken Tandoori', '450 Kcal', 'Chicken & Salad'),
                ],
              ),
            ),

            // Search Button
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle search action
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Search Recipes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build Tab Buttons
  Widget _buildTabButton(String title, int index, Color textColor, Color bgColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: selectedTab == index ? bgColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedTab == index ? Colors.white : textColor,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build Recipe Cards
  Widget _buildRecipeCard(String title, String calories, String description) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Placeholder for image
          Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
            child: Center(child: Text('Image here')),
          ),
          SizedBox(width: 20),
          // Recipe Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$calories',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
