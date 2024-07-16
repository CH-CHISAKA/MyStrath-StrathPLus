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
    // Vibrate device
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<dynamic> productImages = widget.productData['productImage'];
    String productImage = productImages.isNotEmpty ? productImages[0] : ''; // Get the first image
    String name = widget.productData['name'];
    String price = widget.productData['price'].toString();

    return SizedBox(
      height: size.height,
      width: size.width,
      child: InkWell(
       onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductsDetialsScreen(
        productData: widget.productData.data()! as Map<String, dynamic>,
      ),
    ),
  );
},

        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Container(
            width: 140,
            decoration: BoxDecoration(
              // color: const Color(0xFFB7C9F2),
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                // BoxShadow(
                //   color: Color.fromARGB(255, 219, 219, 219),
                //   offset: Offset(0.0, 1.0),
                //   blurRadius: 2.0),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 130,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          productImage,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA400)),
                                ),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      name,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '\$$price',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
                Positioned(
                  top: 8,
                  left: 100,
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
      ),
    );
  }
}