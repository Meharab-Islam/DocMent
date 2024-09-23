import 'package:docment/feature/about-us/domain/our_departments_controller.dart';
import 'package:docment/feature/about-us/domain/our_services_controller.dart';
import 'package:docment/feature/about-us/presentation/our_department_details_screen.dart';
import 'package:docment/feature/about-us/presentation/service_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OurDepartmentScreen extends StatelessWidget {
  final OurDepartmentsController controller =
      Get.put(OurDepartmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Departments'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.departments.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> department =
                controller.departments[index];

            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  // Handle navigation to service details

                  // Get.to(
                  //   ServiceDetailsPage(
                  //     serviceTitle: 'Heart Surgery',
                  //     serviceDescription:
                  //         'Heart surgery involves a range of procedures ...',
                  //     faqs: [
                  //       {
                  //         'question': 'What is heart surgery?',
                  //         'answer':
                  //             'Heart surgery involves treating heart conditions...'
                  //       },
                  //       {
                  //         'question': 'What are the risks?',
                  //         'answer':
                  //             'There are certain risks associated with heart surgery...'
                  //       },
                  //     ],
                  //   ),
                  // );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        department['image'] as String, // Cast to String
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ).animate().fadeIn().scale(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            department['icon'] as IconData, // Cast to IconData
                            size: 30,
                            color: Colors.deepOrange,
                          ).animate().fadeIn().scale(),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title text with wrapping
                                Text(
                                  department['title']
                                      as String, // Cast to String
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ).animate().fadeIn().slideX(),
                                SizedBox(height: 8),

                                // Description text with dynamic height
                                Text(
                                  department['description']
                                      as String, // Cast to String
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  maxLines: null, // Allows unlimited lines
                                  overflow:
                                      TextOverflow.visible, // Avoids truncation
                                ).animate().fadeIn().slideX(delay: 300.ms),

                                SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle service details button
                                      Get.to(
                                        OurDepartmentDetailsScreen(
                                          serviceTitle:
                                              department['title'] as String,
                                          departmentImageUrl:
                                              department['image'] as String,
                                          serviceDescription:
                                              department['description']
                                                  as String,
                                          faqs: const [
                                            {
                                              'question':
                                                  'What is heart surgery?',
                                              'answer':
                                                  'Heart surgery involves treating heart conditions...'
                                            },
                                            {
                                              'question': 'What are the risks?',
                                              'answer':
                                                  'There are certain risks associated with heart surgery...'
                                            },
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Department Details →',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ).animate().fadeIn().scale(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().slideX();
          },
        );
      }),
    );
  }
}
