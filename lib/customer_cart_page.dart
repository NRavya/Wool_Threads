import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

<<<<<<< HEAD
  const CartPage({super.key, required this.cartItems});
=======
  CartPage({required this.cartItems});
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 161, 129, 89),
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
=======
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 161, 129, 89),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
<<<<<<< HEAD
                  margin: const EdgeInsets.all(10),
=======
                  margin: EdgeInsets.all(10),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                        'Quantity: ${item['quantity']} | Price: \$${item['price']}'),
                    trailing: IconButton(
<<<<<<< HEAD
                      icon: const Icon(Icons.delete, color: Colors.red),
=======
                      icon: Icon(Icons.delete, color: Colors.red),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                      onPressed: () {
                        removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: widget.cartItems.isEmpty
          ? null
          : BottomAppBar(
              child: Container(
                height: 60,
<<<<<<< HEAD
                color: const Color.fromARGB(255, 161, 129, 89),
=======
                color: Color.fromARGB(255, 161, 129, 89),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                child: Center(
                  child: Text(
                    'Total: \$${widget.cartItems.fold<int>(
                      0,
<<<<<<< HEAD
                      (sum, item) =>
                          sum +
                          (item['price'] as int) * (item['quantity'] as int),
                    )}',
                    style: const TextStyle(
=======
                      (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int),
                    )}',
                    style: TextStyle(
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
