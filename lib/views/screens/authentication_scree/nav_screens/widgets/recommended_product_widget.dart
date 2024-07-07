import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/widgets/product_item_widget.dart';

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({Key? key});

  @override
  State<RecommendedProductWidget> createState() => _RecommendedProductWidgetState();
}

class _RecommendedProductWidgetState extends State<RecommendedProductWidget> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> productStream =
        FirebaseFirestore.instance.collection('Products').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: productStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final productData = snapshot.data!.docs[index];
              return ProductItemWidget(productData: productData);
            },
          ),
        );
      },
    );
  }
}
