import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mystrath_strathplus/models/cart_model.dart';

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void addCart(CartModel cartModel, List<String> sizes) {
    if (state.containsKey(cartModel.productId)) {
      state = {
        ...state,
        cartModel.productId: state[cartModel.productId]!.copyWith(
          quantity: state[cartModel.productId]!.quantity + 1,
          total: state[cartModel.productId]!.total + cartModel.price,
        ),
      };
    } else {
      state = {
        ...state,
        cartModel.productId: cartModel.copyWith(quantity: 1, total: cartModel.price),
      };
    }
  }

  void removeCart(String productId) {
    if (state.containsKey(productId)) {
      final currentQuantity = state[productId]!.quantity;
      if (currentQuantity > 1) {
        state = {
          ...state,
          productId: state[productId]!.copyWith(
            quantity: currentQuantity - 1,
            total: state[productId]!.total - state[productId]!.price,
          ),
        };
      } else {
        final newState = Map<String, CartModel>.from(state);
        newState.remove(productId);
        state = newState;
      }
    }
  }

  void clearCart() {
    state = {};
  }

  Map<String, CartModel> get cartItems => state;
}

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, CartModel>>((ref) {
  return CartNotifier();
});
