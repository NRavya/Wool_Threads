import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wool_threads/integration/api_service.dart'; // Import your ApiService class
import 'tracking_page.dart';
import 'profits_page.dart';
import 'notifications_page.dart';
import 'dart:async'; // For async operations

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  _FarmerHomePageState createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  late ApiService apiService;
  Map<String, dynamic> dailyProfits = {};
  List<Map<String, dynamic>> shipments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(
        _baseUrl: 'http://localhost:5000/api'); // Use your actual API URL
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      String token =
          'your-jwt-token'; // Replace with the actual token from AuthService or wherever it's stored
      // Fetch daily profits and shipments
      var profits = await apiService.fetchDailyProfits(token);
      var shipmentData = await apiService.fetchShipments(token);

      setState(() {
        dailyProfits = profits;
        shipments = shipmentData;
        isLoading = false; // Stop loading after data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wool Threads',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0077B6),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 182, 215, 254),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Daily Profits Section
                                const Text(
                                  'Daily Profits',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: LineChart(
                                    LineChartData(
                                      gridData: FlGridData(show: true),
                                      titlesData: FlTitlesData(
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 40,
                                            interval: 50,
                                          ),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 30,
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(show: true),
                                      lineBarsData: [
                                        LineChartBarData(
                                          isCurved: true,
                                          spots: (dailyProfits['data'] as List)
                                              .map((e) => FlSpot(
                                                  e['day'].toDouble(),
                                                  e['profit'].toDouble()))
                                              .toList(),
                                          color: const Color(0xFF0077B6),
                                          barWidth: 4,
                                          isStrokeCapRound: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Profit Summary Section
                                const Text(
                                  'Today\'s Profit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Wool Sold:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${dailyProfits['total_wool_sold']} kg',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Price per kg:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '\$${dailyProfits['price_per_kg']}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Divider(color: Colors.black26),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Profit:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0077B6),
                                            ),
                                          ),
                                          Text(
                                            '\$${dailyProfits['total_profit']}',
                                            style: const TextStyle(
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
                                const SizedBox(height: 20),
                                // Shipment Status Section
                                const Text(
                                  'Shipment Tracking Status',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: shipments
                                      .map((shipment) => ShipmentCard(
                                            id: shipment['id'],
                                            destination:
                                                shipment['destination'],
                                            status: shipment['status'],
                                            eta: shipment['eta'],
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(height: 20),
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
                    backgroundColor: const Color(0xFF0077B6),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatBotPage()),
                      );
                    },
                    child: const Icon(Icons.chat, color: Colors.white),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF0077B6),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/traveling.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackingPage()),
                  );
                },
              ),
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/money-3.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyProfitsPage()),
                  );
                },
              ),
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/diagram.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
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

  const ShipmentCard({
    super.key,
    required this.id,
    required this.destination,
    required this.status,
    required this.eta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          'Shipment ID: $id',
          style: const TextStyle(fontWeight: FontWeight.bold),
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
          status == 'Delivered' ? Icons.check_circle : Icons.local_shipping,
          color: status == 'Delivered' ? Colors.green : Colors.blue,
        ),
      ),
    );
  }
}
