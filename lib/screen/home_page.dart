import 'package:flutter/material.dart';
import 'package:project/api/product_list.dart';
import 'package:project/widgets/custom_bottom_navBar.dart';
import 'package:project/widgets/search_bar.dart'; // Import the SearchBarWidget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchText = ''; // State to hold the search text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with SearchBar and notification/chat icons
              Row(
                children: [
                  // SearchBarWidget
                  Expanded(
                    child: SearchBarWidget(
                      onTextChange: (text) {
                        setState(() {
                          _searchText = text; // Update state when text changes
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16), // Spacing between search bar and icons
                  const Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.lock_outline, size: 30, color: Colors.grey),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.chat_bubble_outline,
                          size: 30, color: Colors.grey),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '9+',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Sale Product",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ProductList(searchText: _searchText), // Pass the search text here
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
