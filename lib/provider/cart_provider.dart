import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    String? name,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartNotifier extends StateNotifier<Map<String, CartItem>> {
  CartNotifier() : super({});

  void addToCart(String name, double price) {
    if (state.containsKey(name)) {
      state = {
        ...state,
        name: state[name]!.copyWith(quantity: state[name]!.quantity + 1),
      };
    } else {
      state = {
        ...state,
        name: CartItem(name: name, price: price, quantity: 1),
      };
    }
  }

  void removeFromCart(String name) {
    if (state.containsKey(name)) {
      state = {
        ...state,
      }..remove(name);
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, CartItem>>((ref) {
  return CartNotifier();
});
