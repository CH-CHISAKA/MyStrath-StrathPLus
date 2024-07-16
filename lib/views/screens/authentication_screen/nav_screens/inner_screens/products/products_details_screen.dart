import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetialsScreen extends StatefulWidget {
  final dynamic productData;

  ProductsDetialsScreen({Key? key, required this.productData}) : super(key: key);

  @override
  _ProductsDetialsScreenState createState() => _ProductsDetialsScreenState();
}

class _ProductsDetialsScreenState extends State<ProductsDetialsScreen> {
  List<dynamic> productImages = [];
  List<dynamic> sizeList = [];
  String productImage = '';
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    // Initialize productImages, sizeList, and productImage from widget.productData
    productImages = widget.productData['productImage'] ?? [];
    sizeList = widget.productData['sizes'] as List<dynamic>? ?? [];
    productImage = productImages.isNotEmpty ? productImages[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productData['name'] ?? 'Product Detail'),
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
                  image: NetworkImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 25),
            // Prices and Discount (if available)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: \$${widget.productData['price']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                if (widget.productData['discount'] != null)
                  Text(
                    'Discounted Price: \$${widget.productData['discount']}',
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
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size.toString();
                          });
                        },
                        child: Chip(
                          label: Text(size.toString()),
                          backgroundColor:
                              size.toString() == selectedSize ? Color(0xff3A5DAE) : Colors.grey[300],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            // Description
            Text(
              widget.productData['description'] ?? '',
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
