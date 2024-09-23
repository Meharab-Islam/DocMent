import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedFilter = "All";
  String searchQuery = "";

  // Sample payment data
  List<Map<String, String>> paymentData = [
    {"date": "2024-09-18", "amount": "\$500", "status": "Completed"},
    {"date": "2024-09-17", "amount": "\$200", "status": "Pending"},
    {"date": "2024-09-16", "amount": "\$150", "status": "Completed"},
    {"date": "2024-09-15", "amount": "\$250", "status": "Failed"},
  ];

  // Total payments and today's payment amounts
  String get totalPayment => "\$1100"; // You can calculate this dynamically
  String get todaysPayment =>
      "\$500"; // Also calculate dynamically based on today's date

  // Filtered data based on search and filter options
  List<Map<String, String>> get filteredPayments {
    return paymentData.where((payment) {
      bool matchesSearch =
          searchQuery.isEmpty || payment["date"]!.contains(searchQuery);
      bool matchesFilter =
          selectedFilter == "All" || payment["status"] == selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row with two summary cards
            Row(
              children: [
                // Today's Payment Card
                Expanded(
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Today\'s Payment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            todaysPayment,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 400.ms).slideX(),
                ),
                const SizedBox(width: 10),
                // Total Payment Card
                Expanded(
                  child: Card(
                    elevation: 5,
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            totalPayment,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideX(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by Date',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Filter Dropdown
            DropdownButtonFormField<String>(
              value: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
              items: <String>["All", "Completed", "Pending", "Failed"]
                  .map((String filter) {
                return DropdownMenuItem<String>(
                  value: filter,
                  child: Text(filter),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Filter by Status',
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Payment List Table
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: filteredPayments.map((payment) {
                    return DataRow(
                      cells: [
                        DataCell(Text(payment["date"]!)),
                        DataCell(Text(payment["amount"]!)),
                        DataCell(
                          Text(
                            payment["status"]!,
                            style: TextStyle(
                              color: payment["status"] == "Completed"
                                  ? Colors.green
                                  : payment["status"] == "Pending"
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                          ),
                        ),
                      ],
                      onSelectChanged: (bool? selected) {
                        if (selected != null && selected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentDetailScreen(payment: payment),
                            ),
                          );
                        }
                      },
                    );
                  }).toList(),
                ).animate().fadeIn(duration: 800.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Payment Detail Screen

class PaymentDetailScreen extends StatelessWidget {
  final Map<String, String> payment;

  PaymentDetailScreen({required this.payment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Title with animation
            const Text(
              'Payment Information',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ).animate().fadeIn(duration: 600.ms).slideX(),
            const SizedBox(height: 20),

            // Futuristic card for Payment ID
            _buildFuturisticCard(
              icon: Icons.confirmation_number,
              label: 'Payment ID',
              value: payment["id"] ?? 'Unknown',
              iconColor: Colors.purpleAccent,
            ).animate().scale(duration: 500.ms).fadeIn(),
            const SizedBox(height: 15),

            // Futuristic card for Date
            _buildFuturisticCard(
              icon: Icons.calendar_today,
              label: 'Date',
              value: payment["date"] ?? 'Unknown',
              iconColor: Colors.blueAccent,
            ).animate().scale(duration: 600.ms).fadeIn(),
            const SizedBox(height: 15),

            // Futuristic card for Amount
            _buildFuturisticCard(
              icon: Icons.attach_money,
              label: 'Amount',
              value: payment["amount"] ?? 'Unknown',
              iconColor: Colors.greenAccent,
            ).animate().scale(duration: 700.ms).fadeIn(),
            const SizedBox(height: 15),

            // Futuristic card for Status
            _buildFuturisticCard(
              icon: Icons.info_outline,
              label: 'Status',
              value: payment["status"] ?? 'Unknown',
              iconColor: _getStatusColor(payment["status"]),
            ).animate().scale(duration: 800.ms).fadeIn(),
            const SizedBox(height: 15),

            // Futuristic card for Payment Method
            _buildFuturisticCard(
              icon: Icons.payment,
              label: 'Payment Method',
              value: payment["method"] ?? 'Unknown',
              iconColor: Colors.orangeAccent,
            ).animate().scale(duration: 900.ms).fadeIn(),
            const SizedBox(height: 15),

            // Futuristic card for Transaction ID
            _buildFuturisticCard(
              icon: Icons.vpn_key,
              label: 'Transaction ID',
              value: payment["transactionId"] ?? 'Unknown',
              iconColor: Colors.tealAccent,
            ).animate().scale(duration: 1000.ms).fadeIn(),
          ],
        ),
      ),
    );
  }

  // Futuristic card builder
  Widget _buildFuturisticCard({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    return Card(
      color: Colors.grey.shade900.withOpacity(0.9),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to get color based on status
  Color _getStatusColor(String? status) {
    switch (status) {
      case "Completed":
        return Colors.greenAccent;
      case "Pending":
        return Colors.orangeAccent;
      case "Failed":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
