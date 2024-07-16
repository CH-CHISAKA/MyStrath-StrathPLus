import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mystrath_strathplus/models/cart_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, CartModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void addCart(CartModel cartModel, List<String> selectedSizes) {
    if (state.containsKey(cartModel.productId)) {
      state.update(cartModel.productId, (value) => CartModel(
        name: value.name,
        price: value.price,
        quantity: value.quantity + 1,
        instock: value.instock,
        total: value.total + value.price,
        imageURL: value.imageURL,
        productId: value.productId,
        sizes: value.sizes,
        category: value.category,
        discount: value.discount,
        description: value.description,
      ));
    } else {
      state.putIfAbsent(cartModel.productId, () => CartModel(
        name: cartModel.name,
        price: cartModel.price,
        quantity: 1,
        instock: cartModel.instock,
        total: cartModel.price,
        imageURL: cartModel.imageURL,
        productId: cartModel.productId,
        sizes: cartModel.sizes,
        category: cartModel.category,
        discount: cartModel.discount,
        description: cartModel.description,
      ));
    }
  }

  void removeCart(String productId) {
    if (state.containsKey(productId)) {
      final currentQuantity = state[productId]?.quantity ?? 0;
      if (currentQuantity > 1) {
        state.update(productId, (value) => CartModel(
          name: value.name,
          price: value.price,
          quantity: value.quantity - 1,
          instock: value.instock,
          total: value.total - value.price,
          imageURL: value.imageURL,
          productId: value.productId,
          sizes: value.sizes,
          category: value.category,
          discount: value.discount,
          description: value.description,
        ));
      } else {
        state.remove(productId);
      }
    }
  }

  void clearCart() {
    state.clear();
  }
}
