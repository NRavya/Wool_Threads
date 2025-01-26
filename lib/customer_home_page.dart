// customer_home_page.dart
import 'package:flutter/material.dart';
import 'tracking_page.dart';
import 'profits_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wool Threads - Customer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF0077B6),
        centerTitle: false,
      ),
      body: Container(
        color: Color(0xFFbde0fe),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 250,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Description of product ${index + 1}.',
                              style: TextStyle(fontSize: 14),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${(index + 1) * 10}.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0077B6),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add to cart or view details
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0077B6),
                                  ),
                                  child: Text(
                                    'Buy',
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
      color: Color(0xFF0077B6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, size: 35.0, color: Color(0xFFbde0fe)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.track_changes_outlined, size: 35.0, color: Color(0xFFbde0fe)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage()));
            },
          ),
        ],
      ),
    );
  }
}
