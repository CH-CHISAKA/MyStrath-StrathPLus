import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mystrath_strathplus/models/category_model.dart';
// import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/inner_screens/resturants/resturants_details_screen.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCategories();
  }

  void _fetchCategories() {
  _firestore
    .collection('Categories')
    .snapshots()
    .listen((QuerySnapshot querySnapshot) {
      categories.assignAll(
        querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return CategoryModel(
            categoryName: data['categoryName'],
            categoryImage: data['categoryImage'],
          );
        }).toList(),
      );
    });
  }}