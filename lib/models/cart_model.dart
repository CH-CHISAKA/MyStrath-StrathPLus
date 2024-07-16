

class CartModel {
 final String name;
  final double price;
  final double quantity;
  final double instock;
  final double total;
  final String imageURL;
  final String productId;
  final List<String> sizes; 
  final String category;
  final double? discount;
  final String description;

  CartModel({required this.name, required this.price, required this.quantity, required this.instock, required this.total, required this.imageURL, required this.productId, required this.sizes, required this.category, required this.discount, required this.description});



}