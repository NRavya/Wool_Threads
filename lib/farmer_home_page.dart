import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wool_threads/stats_page.dart';
import 'tracking_page.dart';
import 'profits_page.dart';
import 'notifications_page.dart';

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
        backgroundColor: Color(0xFF0077B6),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 182, 215, 254),
      ),
      body: Stack(
        children: [
          // Main Content
          Container(
            color: Color.fromARGB(255, 182, 215, 254), // Full background color
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10), // Padding for content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Graph Section
                          Text(
                            'Daily Profits',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 300, // Adjust height of the graph
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 40,
                                      interval: 50,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            color: Color(0xFF0077B6),
                                            fontSize: 12,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          'Day ${value.toInt()}',
                                          style: TextStyle(
                                            color: Color(0xFF0077B6),
                                            fontSize: 12,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                lineBarsData: [
                                  LineChartBarData(
                                    isCurved: true,
                                    spots: [
                                      FlSpot(0, 100),
                                      FlSpot(1, 120),
                                      FlSpot(2, 140),
                                      FlSpot(3, 80),
                                      FlSpot(4, 200),
                                      FlSpot(5, 180),
                                      FlSpot(6, 250),
                                    ],
                                    color: Color(0xFF0077B6),
                                    barWidth: 4,
                                    isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Profit Summary Section
                          Text(
                            'Today\'s Profit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Wool Sold:',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '50 kg',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price per kg:',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$50',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Divider(color: Colors.black26),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Profit:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0077B6),
                                      ),
                                    ),
                                    Text(
                                      '\$2500',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0077B6),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Tracking Status Section
                          Text(
                            'Shipment Tracking Status',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ShipmentCard(
                                  id: '#001',
                                  destination: 'City A',
                                  status: 'In Transit',
                                  eta: '2 Days',
                                ),
                                ShipmentCard(
                                  id: '#002',
                                  destination: 'City B',
                                  status: 'Delivered',
                                  eta: 'Completed',
                                ),
                                ShipmentCard(
                                  id: '#003',
                                  destination: 'City C',
                                  status: 'Pending Pickup',
                                  eta: '5 Days',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Wool Standards Section
                          Text(
                            'Wool Standards',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Micron Count: 20-22 microns.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '2. Staple Length: 3-4 inches.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '3. Clean Wool Yield: Above 70%.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '4. Fiber Strength: High tensile strength.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Chatbot Button
          Positioned(
            bottom: 25,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF0077B6),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatBotPage()),
                );
              },
              child: Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF0077B6),
        child: SizedBox(
          height: 70, // Adjust the height of the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: ImageIcon(
                  AssetImage("assets/traveling.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrackingPage()),
                  );// Navigate to the tracking page
                },
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage("assets/money-3.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DailyProfitsPage()),
                  );
                },
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage("assets/diagram.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MarketStatsPage()),
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

class ShipmentCard extends StatelessWidget {
  final String id;
  final String destination;
  final String status;
  final String eta;

  ShipmentCard({
    required this.id,
    required this.destination,
    required this.status,
    required this.eta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          'Shipment ID: $id',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destination: $destination'),
            Text('Status: $status'),
            Text('ETA: $eta'),
          ],
        ),
        trailing: Icon(
          status == 'Delivered'
              ? Icons.check_circle
              : Icons.local_shipping,
          color: status == 'Delivered' ? Colors.green : Colors.blue,
        ),
      ),
    );
  }
}

class ChatBotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Center(
        child: Text('Chatbot Interface Coming Soon!'),
      ),
    );
  }
}
