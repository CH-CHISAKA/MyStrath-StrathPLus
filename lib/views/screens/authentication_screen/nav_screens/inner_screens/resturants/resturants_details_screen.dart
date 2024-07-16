import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantsDetailScreen extends StatelessWidget {
  const RestaurantsDetailScreen({super.key, required this.productData});

  final dynamic productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData['categoryName'],
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.7,
            ),
          ),
        ),
        backgroundColor: const Color(0xff3A5DAE),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Restaurant Details',
              textAlign: TextAlign.center,
              style: TextStyle(  
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
