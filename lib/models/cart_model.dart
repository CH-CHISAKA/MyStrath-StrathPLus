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

  CartModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.instock,
    required this.total,
    required this.imageURL,
    required this.productId,
    required this.sizes,
    required this.category,
    required this.discount,
    required this.description,
  });

  CartModel copyWith({
    String? name,
    num? price,
    num? quantity,
    double? instock,
    num? total,
    String? imageURL,
    String? productId,
    List<String>? sizes,
    String? category,
    num? discount,
    String? description,
  }) {
    return CartModel(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      instock: instock ?? this.instock,
      total: total ?? this.total,
      imageURL: imageURL ?? this.imageURL,
      productId: productId ?? this.productId,
      sizes: sizes ?? this.sizes,
      category: category ?? this.category,
      discount: discount ?? this.discount,
      description: description ?? this.description,
    );
  }
}
