import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystrath_strathplus/models/cart_model.dart';
import 'package:mystrath_strathplus/provider/cart_provider.dart' as cp; // Alias the cart_provider import
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/cart_screen.dart';

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
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    productImages = widget.productData['productImage'] ?? [];
    sizeList = widget.productData['sizes'] as List<dynamic>? ?? [];
    productImage = productImages.isNotEmpty ? productImages[0] : '';
  }

  void toggleSizeSelection(String size) {
    setState(() {
      if (selectedSize == size) {
        selectedSize = '';
      } else {
        selectedSize = size;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cp.cartProvider.notifier); // Use aliased import here
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: KES ${widget.productData['price']}',
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.productData['discount'] != null && widget.productData['discount'] > 0
                        ? Colors.red
                        : Colors.white,
                    fontWeight: FontWeight.w400,
                    decoration: widget.productData['discount'] != null && widget.productData['discount'] > 0
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                if (widget.productData['discount'] != null && widget.productData['discount'] > 0)
                  Text(
                    'Discounted Price: KES ${widget.productData['discount']}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 35),
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
                          backgroundColor: selectedSize == size.toString()
                              ? const Color(0xFF7C9EED)
                              : const Color(0xFFD9D9D9),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            Text(
              widget.productData['description'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedSize.isNotEmpty) {
                  final cartModel = CartModel(
                    name: widget.productData['name'],
                    price: (widget.productData['price'] as num?)?.toDouble() ?? 0.0,
                    quantity: 1.0,
                    instock: (widget.productData['instock'] as num?)?.toDouble() ?? 0.0,
                    total: (widget.productData['price'] as num?)?.toDouble() ?? 0.0,
                    imageURL: widget.productData['productImage'][0] ?? '',
                    productId: widget.productData['productId'] ?? '',
                    sizes: [selectedSize],
                    category: widget.productData['category'] ?? '',
                    discount: (widget.productData['discount'] as num?)?.toDouble(),
                    description: widget.productData['description'] ?? '',
                  );

                  cartNotifier.addCart(cartModel, [selectedSize]);

                  // Navigate to CartScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.all(16),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text(widget.productData['sizes'].isEmpty
                          ? 'No sizes available'
                          : 'Please select a quantity'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
