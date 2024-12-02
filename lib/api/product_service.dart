import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  // Base URL of the API
  static const String _baseUrl = 'https://fakestoreapi.com/products';

  // Method to fetch products
  Future<List<dynamic>> fetchProducts() async {
    try {
      // Make a GET request
      final response = await http.get(Uri.parse(_baseUrl));

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse and return the JSON data
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      // Handle errors
      throw Exception('Error fetching products: $e');
    }
  }
}
