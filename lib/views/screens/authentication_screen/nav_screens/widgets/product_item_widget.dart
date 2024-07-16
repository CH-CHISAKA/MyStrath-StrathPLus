import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/inner_screens/products/products_details_screen.dart';
import 'package:vibration/vibration.dart';

class ProductItemWidget extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> productData;

  const ProductItemWidget({Key? key, required this.productData}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    _printProductData();
  }

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
    _vibrate();
  }

  Future<void> _vibrate() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;
    if (hasVibrator) {
      Vibration.vibrate(duration: 50);
    }
  }

  void _printProductData() {
    print('productImage: ${widget.productData['productImage']}');
    print('name: ${widget.productData['name']}');
    print('price: ${widget.productData['price']}');
    print('discount: ${widget.productData['discount']}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<dynamic> productImages = widget.productData['productImage'];
    String productImage = productImages.isNotEmpty ? productImages[0] : '';
    String name = widget.productData['name'];
    num priceInUSD = widget.productData['price'];
    num discount = widget.productData['discount'] ?? 0;
    bool hasDiscount = discount > 0;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsDetailsScreen(
              productData: widget.productData.data()! as Map<String, dynamic>,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Maintain some padding around the item
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Adjusted borderRadius
          ),
          child: Stack( // Use a Stack to allow positioning
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 110, // Reduced height for the image
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70), // Make it large to ensure a circle
                      child: Image.network(
                        productImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA400)),
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 4), // Reduced spacing between elements
                  Text(
                    name,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4), // Reduced spacing between elements
                  if (hasDiscount)
                    Text(
                      'KES ${priceInUSD.toStringAsFixed(0)}',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  else
                    Text(
                      'KES ${priceInUSD.toStringAsFixed(0)}',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(height: 2),
                ],
              ),
              Positioned( // Positioned to place the favorite icon
                top: 3,
                right: 17,
                child: GestureDetector(
                  onTap: toggleFavourite,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 13, 34),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33FF20000),
                          spreadRadius: 0,
                          offset: Offset(0.0, 7.0),
                          blurRadius: 15.0,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
