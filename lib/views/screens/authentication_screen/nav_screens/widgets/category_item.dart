import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystrath_strathplus/controllers/category_controller.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  const CategoryItem({super.key, required this.title});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 17.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
             const SizedBox(height: 2), 
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryController.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 3,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(
                        categoryController.categories[index].categoryImage,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categoryController.categories[index].categoryName,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 12.5,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
