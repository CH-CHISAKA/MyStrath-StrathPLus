import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/category_item.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/recommended_product_widget.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/strathplus_header_implementation_widget.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/resuable_text_widget.dart';

class StrathPLusImplementation extends StatefulWidget {
  const StrathPLusImplementation({super.key});

  @override
  State<StrathPLusImplementation> createState() => _StrathPLusImplementationState();
}

class _StrathPLusImplementationState extends State<StrathPLusImplementation> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StrathPLusHeaderImplementation(),
            SizedBox(height: 5),
            CategoryItem(
              title: "Resturants",
            ),
            SizedBox(height: 20),
            ReusableTextWidget(
              title: "Recommended Products",
              subtitle: "View all",
            ),
            RecommendedProductWidget(),
            
          ],
        ),
      ),
    );
  }
}

