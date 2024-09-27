import 'package:docment/core/widget/text_style.dart';
import 'package:docment/feature/about-us/domain/our_services_controller.dart';
import 'package:docment/feature/about-us/presentation/service_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicePage extends StatelessWidget {
  final ServiceController controller = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleText(text: 'Our Services'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.services.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> service = controller.services[index];

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
                        service['image'] as String, // Cast to String
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
                            service['icon'] as IconData, // Cast to IconData
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
                                  service['title'] as String, // Cast to String
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ).animate().fadeIn().slideX(),
                                SizedBox(height: 8),

                                // Description text with dynamic height
                                Text(
                                  service['description']
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
                                        ServiceDetailsPage(
                                          serviceTitle: service['title'] as String,
                                          serviceDescription:
                                              service['description'] as String,

                                          serviceImageUrl: service['image'] as String,

                                          faqs: [
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
                                      'Service Details →',
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
