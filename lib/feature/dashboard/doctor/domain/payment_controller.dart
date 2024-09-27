import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedFilter = "All".obs;
  var searchQuery = "".obs;

  // Sample payment data
  List<Map<String, String>> paymentData = [
    {"date": "2024-09-18", "amount": "\$500", "status": "Completed"},
    {"date": "2024-09-17", "amount": "\$200", "status": "Pending"},
    {"date": "2024-09-16", "amount": "\$150", "status": "Completed"},
    {"date": "2024-09-15", "amount": "\$250", "status": "Failed"},
  ];

  // Total payments and today's payment amounts
  String get totalPayment => "\$1100"; // Calculate dynamically if needed
  String get todaysPayment => "\$500"; // Calculate dynamically if needed

  // Filtered data based on search and filter options
  List<Map<String, String>> get filteredPayments {
    return paymentData.where((payment) {
      bool matchesSearch =
          searchQuery.value.isEmpty || payment["date"]!.contains(searchQuery.value);
      bool matchesFilter =
          selectedFilter.value == "All" || payment["status"] == selectedFilter.value;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
