import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define your cart provider here
final cartProvider = Provider<Map<String, CartItem>>((ref) {
  // Provide your cart items map here
  return {};
});

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider).values.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color(0xff3A5DAE),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.name),
            subtitle: Text('Price: ${cartItem.price}'),
            trailing: Text('Quantity: ${cartItem.quantity}'),
          );
        },
      ),
    );
  }
}
