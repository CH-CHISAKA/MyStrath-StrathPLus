import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystrath_strathplus/models/cart_model.dart';
import 'package:mystrath_strathplus/provider/cart_provider.dart';

class ProductsDetailsScreen extends ConsumerStatefulWidget {
  final dynamic productData;

  const ProductsDetailsScreen({Key? key, required this.productData}) : super(key: key);

  @override
  _ProductsDetailsScreenState createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends ConsumerState<ProductsDetailsScreen> {
  List<dynamic> productImages = [];
  List<dynamic> sizeList = [];
  String productImage = '';
  String selectedSize = ''; // Updated to store single selected size

  @override
  void initState() {
    super.initState();
    // Initialize productImages, sizeList, and productImage from widget.productData
    productImages = widget.productData['productImage'] ?? [];
    sizeList = widget.productData['sizes'] as List<dynamic>? ?? [];
    productImage = productImages.isNotEmpty ? productImages[0] : '';
  }

  void toggleSizeSelection(String size) {
    setState(() {
      if (selectedSize == size) {
        selectedSize = ''; // Deselect size if already selected
      } else {
        selectedSize = size; // Select size if not selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);
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
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            // Prices and Discount (if available)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: KES ${widget.productData['price']}',
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.productData['discount'] != null && widget.productData['discount'] > 0
                        ? Colors.red // Price color becomes red if discount exists
                        : Colors.white, // Default color when no discount
                    fontWeight: FontWeight.w400, // Reduced font weight for price
                    decoration: widget.productData['discount'] != null && widget.productData['discount'] > 0
                        ? TextDecoration.lineThrough // Apply line through if discount exists
                        : null,
                  ),
                ),
                if (widget.productData['discount'] != null && widget.productData['discount'] > 0)
                  Text(
                    'Discounted Price: KES ${widget.productData['discount']}',
                    style: TextStyle(
                      fontSize: 15, // Increased font size for discounted price
                      fontWeight: FontWeight.bold, // Increased font weight for discounted price
                      color: Colors.white, // Always white color for discounted price
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 25),
            // Sizes
            if (sizeList.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Quantities:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: sizeList.map<Widget>((size) {
                      return GestureDetector(
                        onTap: () {
                          toggleSizeSelection(size.toString());
                        },
                        child: Chip(
                          label: Text(size.toString()),
                          backgroundColor:
                              selectedSize == size.toString()
                                  ? const Color(0xFF7C9EED)
                                  : const Color(0xFFD9D9D9),
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
                if (selectedSize.isNotEmpty) {
                  // Create a CartModel instance from productData and selectedSize
                  final cartModel = CartModel(
                    name: widget.productData['name'],
                    price: (widget.productData['price'] as double).toDouble(),
                    quantity: 1.0,
                    instock: (widget.productData['instock'] as double).toDouble(),
                    total: (widget.productData['price'] as double).toDouble(),
                    imageURL: widget.productData['productImage'][0],
                    productId: widget.productData['productId'],
                    sizes: [selectedSize], // Store selected size as list
                    category: widget.productData['category'],
                    discount: (widget.productData['discount'] as double?)?.toDouble(),
                    description: widget.productData['description'],
                  );

                  // Implement add to cart functionality
                  cartNotifier.addCart(cartModel, [selectedSize]);
                } else {
                  // Handle case where no size is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a size.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
