import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onTextChange; // Callback for text change

  const SearchBarWidget({Key? key, required this.onTextChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: TextField(
        onChanged: onTextChange, // Trigger callback when text changes
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the default border
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search, color: Colors.green), // Search icon
        ),
      ),
    );
  }
}
