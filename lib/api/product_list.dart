import 'package:flutter/material.dart';
import 'package:project/api/product_service.dart';
import 'package:project/widgets/product_card.dart';
import 'package:project/screen/product_detail.dart'; // Import the ProductDetail screen

class ProductList extends StatefulWidget {
  final String searchText;

  const ProductList({Key? key, required this.searchText}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductService _productService = ProductService();
  late Future<List<dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = _productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final products = snapshot.data!;
          final filteredProducts = products.where((product) {
            final title = product['title'].toLowerCase();
            final searchText = widget.searchText.toLowerCase();
            return title.contains(searchText);
          }).toList();

          if (filteredProducts.isEmpty) {
            return Center(child: Text('No products found'));
          }

          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  title: product['title'],
                  price: product['price'].toString(),
                  imageUrl: product['image'],
                  isFavorite: product['isFavorite'] ?? false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          product: product, // Pass the product data
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No products found'));
        }
      },
    );
  }
}
