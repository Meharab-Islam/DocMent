import 'package:docment/feature/dashboard/doctor/widget/payment_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class PaymentDetailScreen extends StatelessWidget {
  final Map<String, String> payment;

  const PaymentDetailScreen({required this.payment});

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
            const Text(
              'Payment Information',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ).animate().fadeIn(duration: 600.ms).slideX(),
            const SizedBox(height: 20),
            // Payment details
            FuturisticCard(
              icon: Icons.confirmation_number,
              label: 'Payment ID',
              value: payment["id"] ?? 'Unknown',
              iconColor: Colors.purpleAccent,
            ).animate().scale(duration: 500.ms).fadeIn(),
            const SizedBox(height: 15),
            FuturisticCard(
              icon: Icons.calendar_today,
              label: 'Date',
              value: payment["date"] ?? 'Unknown',
              iconColor: Colors.blueAccent,
            ).animate().scale(duration: 500.ms).fadeIn(),
            const SizedBox(height: 15),
            FuturisticCard(
              icon: Icons.attach_money,
              label: 'Amount',
              value: payment["amount"] ?? 'Unknown',
              iconColor: Colors.greenAccent,
            ).animate().scale(duration: 500.ms).fadeIn(),
            const SizedBox(height: 15),
            FuturisticCard(
              icon: Icons.info,
              label: 'Status',
              value: payment["status"] ?? 'Unknown',
              iconColor: payment["status"] == "Completed"
                  ? Colors.green
                  : payment["status"] == "Pending"
                      ? Colors.orange
                      : Colors.red,
            ).animate().scale(duration: 500.ms).fadeIn(),
          ],
        ),
      ),
    );
  }
}
