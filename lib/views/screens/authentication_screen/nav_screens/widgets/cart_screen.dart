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
  String selectedPaymentMethod = 'M-Pesa'; // Default payment method
  bool paymentConfirmed = false; // Track payment confirmation status

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider).values.toList();

    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.7,
          ),
        ),
        backgroundColor: const Color(0xff3A5DAE),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to cart screen or any other action
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${cartItems.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Product List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('Price: ${cartItem.price.toStringAsFixed(2)}'),
                  trailing: Text('Quantity: ${cartItem.quantity}'),
                );
              },
            ),
            const Divider(),

            // Total Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total Amount to be Paid:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Payment Method Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: selectedPaymentMethod,
                items: ['M-Pesa', 'MasterCard', 'Visa'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Select Payment Method',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Proceed to Checkout Button
            if (!paymentConfirmed)
              ElevatedButton(
                onPressed: () {
                  // Simulate payment confirmation (could integrate with real payment gateway)
                  setState(() {
                    paymentConfirmed = true;
                  });
                  // Clear cart after payment confirmation
                  ref.read(cartProvider).clear(); // Clear the cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Payment confirmed and order received!'),
                    ),
                  );
                },
                child: const Text('Proceed to Checkout'),
              ),
          ],
        ),
      ),
    );
  }
}
