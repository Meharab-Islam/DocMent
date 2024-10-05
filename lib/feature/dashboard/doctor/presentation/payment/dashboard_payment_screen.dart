import 'package:docment/feature/dashboard/doctor/controller/payment_controller.dart';
import 'package:docment/feature/dashboard/doctor/presentation/payment/payment_details_screen.dart';
import 'package:docment/feature/dashboard/doctor/widget/payment_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row with two summary cards
            Row(
              children: [
                Expanded(
                  child: PaymentCard(
                    title: "Today's Payment",
                    amount: "\$500", // Update dynamically if needed
                    color: Colors.blueAccent,
                  ).animate().fadeIn(duration: 400.ms).slideX(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PaymentCard(
                    title: "Total Payment",
                    amount: "\$1100", // Update dynamically if needed
                    color: Colors.redAccent,
                  ).animate().fadeIn(duration: 600.ms).slideX(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Search Bar
            TextField(
              onChanged: (value) {
                paymentController
                    .updateSearchQuery(value); // Update search query
              },
              decoration: InputDecoration(
                labelText: 'Search by Date',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Filter Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: paymentController.selectedFilter.value,
                  onChanged: (value) {
                    if (value != null) {
                      paymentController.updateFilter(value); // Update filter
                    }
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
                )).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Payment List Table
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() => DataTable(
                      columns: const [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: paymentController.filteredPayments.map((payment) {
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
                    )).animate().fadeIn(duration: 800.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Payment Detail Screen remains the same, but you should import the FuturisticCard from payment_widgets.dart.
