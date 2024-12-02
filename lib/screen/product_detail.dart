import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top Row with Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigates back to the home page
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border,
                          size: 24.0, color: Colors.grey),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.share, size: 24.0, color: Colors.grey),
                      SizedBox(
                        width: 20,
                      ),
                      Stack(
                        children: [
                          Icon(Icons.shopping_bag,
                              size: 24.0, color: Colors.grey),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              // Product Image
              SizedBox(
                width: 390.0, // Desired width
                height: 390.0, // Desired height
                child: Image.network(
                  product['image'],
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                height: 25,
              ),

              // Store Name
              Row(
                children: [
                  Icon(Icons.storefront, size: 24.0, color: Colors.grey),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hokieeshop",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // Product Title
              Text(
                product['title'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 10,
              ),

              // Rating Row
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${product['rating']['rate']} Rating'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('- ${product['rating']['count']} Reviews'),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // Product Description
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    product['description'],
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ),
              // Price and Buy Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Price
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$${product['price']}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Buy Now Button
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade100,
                      ),
                     
                      child: Row(
                        children: [
                          // Cart with badge
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.green,
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 5,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    
                          // "Buy Now" text
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25.0),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
