import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetialScreen extends StatelessWidget {
  const ProductsDetialScreen({super.key, required this.productData});

  final dynamic productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Color(0xff3A5DAE),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w500,
          letterSpacing: .7,
        ),
      ),
      body: const Center(
        child: Text('Product Details'),
      ),
    );
  }
}
