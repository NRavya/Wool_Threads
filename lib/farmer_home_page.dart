import 'package:flutter/material.dart';
import 'tracking_page.dart';
import 'profits_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FarmerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wool Threads',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF6a994e),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 212, 245, 173), // Set background color
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
              height: 250, // Set the height of the entire scrolling area
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemCount: 10, // Number of product boxes
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 250, // Width of each product box
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
                              'This is a description of product ${index + 1}.',
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
                                    color: Color(0xFF6a994e),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add to cart or view details
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF6a994e),
                                  ),
                                  child: Text('Buy',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
      bottomNavigationBar: SizedBox(
        height: 100, 
        child: BottomAppBar(
        color: Color(0xFF6a994e),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 35.0, color: Color.fromARGB(255, 212, 245, 173)),
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/home') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmerHomePage(),
                      settings: RouteSettings(name: '/home'),
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.track_changes_outlined, size: 35.0, color: Color.fromARGB(255, 212, 245, 173)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackingPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.monetization_on, color: Color.fromARGB(255, 212, 245, 173)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailyProfitsPage()),
                );
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.yarn, size: 35.0, color: Color.fromARGB(255, 212, 245, 173)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Market Information'),
                      content: Text('Wool Prices: \$50 per kg\nMarket Trend: Stable'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}