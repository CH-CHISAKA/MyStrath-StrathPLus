import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductItemWidget extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> productData;

  const ProductItemWidget({Key? key, required this.productData}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), 
      child: Container(
        width: 200, 
        decoration: BoxDecoration(
          color: const Color(0xFFB7C9F2),
          borderRadius: BorderRadius.circular(100), 
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 219, 219, 219),
              offset: Offset(0.0, 1.0),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 130, 
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  widget.productData['productImage'],
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
                ),
              ),
            ),
            const SizedBox(height: 2),

            Text(
              widget.productData['productName'],
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              widget.productData['Price'],
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),


          ],
        ),
      ),
    );
  }
}
