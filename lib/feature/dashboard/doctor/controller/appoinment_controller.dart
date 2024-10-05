import 'package:get/get.dart';

class DashBoardAppointmentController extends GetxController {
  var selectedFilter = "All".obs;
  var searchQuery = "".obs;

  // Sample appointment data
  List<Map<String, String>> appointments = [
    {"date": "2024-09-25", "time": "10:00 AM", "status": "Upcoming", "description": "Regular check-up"},
    {"date": "2024-09-24", "time": "01:00 PM", "status": "Past", "description": "Follow-up appointment"},
    {"date": "2024-09-26", "time": "09:00 AM", "status": "Cancelled", "description": "Cancelled due to scheduling conflict"},
    // Add more appointments as needed
  ];

  // Observable list for filtered appointments
  RxList<Map<String, String>> get filteredAppointments {
    return appointments.where((appointment) {
      final matchesSearchQuery = appointment["date"]!.contains(searchQuery.value);
      final matchesFilter = selectedFilter.value == "All" ||
          (selectedFilter.value == "Upcoming" && appointment["status"] == "Upcoming") ||
          (selectedFilter.value == "Past" && appointment["status"] == "Past") ||
          (selectedFilter.value == "Cancelled" && appointment["status"] == "Cancelled");
      return matchesSearchQuery && matchesFilter;
    }).toList().obs;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }



int countUpcomingAppointments() {
    return filteredAppointments.where((appointment) => appointment["status"] == "Upcoming").length;
  }

  int countCancelledAppointments() {
    return filteredAppointments.where((appointment) => appointment["status"] == "Cancelled").length;
  }

  int countPastAppointments() {
    return filteredAppointments.where((appointment) => appointment["status"] == "Past").length;
  }


}
