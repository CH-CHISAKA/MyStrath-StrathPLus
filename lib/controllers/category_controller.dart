

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mystrath_strathplus/models/category_model.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<CategoryModel> Categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    
    _fetchCategories();
  }

  void _fetchCategories (){
    _firestore
    .collection('Categories')
    .snapshots()
    .listen((QuerySnapshot querySnapshot) {
      Categories.assignAll(
        querySnapshot.docs.map((doc){
          final data = doc.data() as Map<String, dynamic>;
          return CategoryModel(
            categoryName: data ['categoryName'], 
            categoryImage: data ['categoryImage']);
        })
      );
     });
  }
}