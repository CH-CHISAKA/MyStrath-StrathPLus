import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetialsScreen extends StatelessWidget {
  final dynamic productData;

   ProductsDetialsScreen({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    List<dynamic> productImages = productData['productImage'];
    final List<dynamic> sizeList = (productData['sizes'] as List<dynamic>?) ?? [];
    String productImage = productImages.isNotEmpty ? productImages[0] : '';
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(productData['name'] ?? 'Product Detail'),
        backgroundColor: const Color(0xff3A5DAE),
        titleTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.7,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your favorite logic here
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productImage), // Use the first image in productImages
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Prices and Discount (if available)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: \$${productData['price']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                  ),
                ),
                if (productData['discount'] != null)
                  Text(
                    'Discounted Price: \$${productData['discount']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 25),
            // Sizes
            if (sizeList.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Sizes:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: sizeList.map<Widget>((size) {
                      return Chip(
                        label: Text(size.toString()),
                        backgroundColor: Colors.grey[300],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            // Description
            Text(
              productData['description'] ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 25),
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                // Implement add to cart functionality
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
