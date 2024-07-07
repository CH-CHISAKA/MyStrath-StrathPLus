import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/widgets/strathplus_header_implementation_widget.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/widgets/resuable_text_widget.dart';

class StrathPLusImplementation extends StatefulWidget {
  const StrathPLusImplementation({super.key});

  @override
  State<StrathPLusImplementation> createState() => _StrathPLusImplementationState();
}

class _StrathPLusImplementationState extends State<StrathPLusImplementation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StrathPLusHeaderImplementation(),
            ReusableTextWidget(
              title: "Recommended Products",
              subtitle: "View all",
            ),
            
          ],
        ),
      ),
    );
  }
}

