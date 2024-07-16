

class CartModel {
 final String name;
  final num price;
  final num quantity;
  final double instock;
  final num total;
  final String imageURL;
  final String productId;
  final List<String> sizes; 
  final String category;
  final num? discount;
  final String description;

  CartModel({required this.name, required this.price, required this.quantity, required this.instock, required this.total, required this.imageURL, required this.productId, required this.sizes, required this.category, required this.discount, required this.description});



}