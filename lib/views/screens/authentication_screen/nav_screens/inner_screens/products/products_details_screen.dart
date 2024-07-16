import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetialsScreen extends StatelessWidget {
  const ProductsDetialsScreen({super.key, required this.productData});

  final dynamic productData;

  @override
  Widget build(BuildContext context) {
  final productData = this.productData;
   final _sizeList = (productData['sizes'] as List?) ?? [];


   Size size = MediaQuery.of(context).size;


   return SizedBox(
     height: size.height,
     width: size.width,
     child: Scaffold(
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

      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
        )
      ),
      ),
    );
  }
}