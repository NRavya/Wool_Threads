import 'package:flutter/material.dart';
import 'tracking_page.dart';
import 'customer_cart_page.dart'; // Import the Cart Page

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Sweater', 'description': 'Cozy wool sweater', 'price': 500},
    {'name': 'Jacket', 'description': 'Warm wool jacket', 'price': 700},
    {'name': 'Blanket', 'description': 'Soft wool blanket', 'price': 300},
    {'name': 'Gloves', 'description': 'Comfortable wool gloves', 'price': 200},
    {'name': 'Bag', 'description': 'Stylish wool bag', 'price': 400},
    {'name': 'Quilt', 'description': 'Handmade wool quilt', 'price': 600},
    {'name': 'Sweater', 'description': 'Modern wool sweater', 'price': 550},
    {'name': 'Jacket', 'description': 'Elegant wool jacket', 'price': 750},
    {'name': 'Blanket', 'description': 'Luxurious wool blanket', 'price': 35},
    {'name': 'Gloves', 'description': 'Durable wool gloves', 'price': 25},
  ];

  final List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final index =
          cartItems.indexWhere((item) => item['name'] == product['name']);
      if (index != -1) {
        cartItems[index]['quantity'] +=
            1; // Increment quantity if the product is already in the cart
      } else {
        cartItems.add(
            {...product, 'quantity': 1}); // Add product to cart with quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wool Threads - Customer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 161, 129, 89),
        automaticallyImplyLeading: false, // This removes the back button
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(cartItems: cartItems)),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF7E7CE),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Arrivals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return SizedBox(
                    width: 250,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product['description'],
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹${product['price']}.00',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 161, 129, 89),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    addToCart(product);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 161, 129, 89),
                                  ),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 161, 129, 89),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, size: 35.0, color: Color(0xFFF7E7CE)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.track_changes_outlined,
                size: 35.0, color: Color(0xFFF7E7CE)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrackingPage()));
            },
          ),
        ],
      ),
    );
  }
}
