// home_page.dart
import 'package:flutter/material.dart';
import 'tracking_page.dart'; // Import the tracking page
import 'settings_page.dart'; // Import the settings page
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
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
        backgroundColor: Color(0xFF0077B6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Warm Threads!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Here you can track your wool supply chain, adjust settings, and view market information.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFbde0fe),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 35.0, color: Color(0xFF0077B6)),
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/home') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                      settings: RouteSettings(name: '/home'),
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.track_changes_outlined, size: 35.0, color: Color(0xFF0077B6)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackingPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, size: 35.0, color: Color(0xFF0077B6)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.yarn, size: 35.0, color: Color(0xFF0077B6)),
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
    );
  }
}
