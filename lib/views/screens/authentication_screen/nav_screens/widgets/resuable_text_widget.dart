import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTextWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const ReusableTextWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  State<ReusableTextWidget> createState() => _ReusableTextWidgetState();
}

class _ReusableTextWidgetState extends State<ReusableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            widget.subtitle,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: const Color(0xFF7C9EED),
            ),
          ),
        ],
      ),
    );
  }
}
