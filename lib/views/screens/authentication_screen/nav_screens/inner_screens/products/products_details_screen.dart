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
  List<String> selectedSizes = [];

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
      if (selectedSizes.contains(size)) {
        selectedSizes.remove(size); // Deselect size if already selected
      } else {
        selectedSizes.add(size); // Select size if not selected
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
                    fontSize: 18,
                    color: Colors.white, // Change to white when no discount
                    fontWeight: FontWeight.bold,
                    decoration: widget.productData['discount'] != null && widget.productData['discount'] > 0
                        ? TextDecoration.lineThrough
                        : null, // Apply line through if discount exists
                  ),
                ),
                if (widget.productData['discount'] != null && widget.productData['discount'] > 0)
                  Text(
                    'Discounted Price: KES ${widget.productData['discount']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                              selectedSizes.contains(size.toString())
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
                // Create a CartModel instance from productData and selectedSizes
                final cartModel = CartModel(
                  name: widget.productData['name'],
                  price: (widget.productData['price'] as double).toDouble(),
                  quantity: 1.0,
                  instock: (widget.productData['instock'] as double).toDouble(),
                  total: (widget.productData['price'] as double).toDouble(),
                  imageURL: widget.productData['productImage'][0],
                  productId: widget.productData['productId'],
                  sizes: selectedSizes,
                  category: widget.productData['category'],
                  discount: (widget.productData['discount'] as double?)?.toDouble(),
                  description: widget.productData['description'],
                );

                // Implement add to cart functionality
                cartNotifier.addCart(cartModel, selectedSizes);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
