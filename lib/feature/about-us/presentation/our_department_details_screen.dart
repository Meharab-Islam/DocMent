import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

class OurDepartmentDetailsScreen extends StatelessWidget {
  final String serviceTitle;
  final String serviceDescription;
  final String departmentImageUrl;
  final List<Map<String, String>> faqs;

  OurDepartmentDetailsScreen({
    required this.serviceTitle,
    required this.serviceDescription,
    required this.faqs, required this.departmentImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          serviceTitle,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Color Grading
            Stack(
              children: [
                // Pexels image placeholder
                Image.network(
                  departmentImageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                // Gradient Overlay for Color Grading
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    serviceTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Description
                  Text(
                    'About the Service',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    serviceDescription,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  // FAQ Section
                  Text(
                    'Frequently Asked Questions',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  // FAQ Accordion
                  ..._buildFAQList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // Method to generate FAQ list using GFAccordion
  // List<Widget> _buildFAQList() {
  //   return faqs.map((faq) {
  //     return GFAccordion(
  //       titleChild: Row(
  //         children: [
  //           Icon(Icons.question_answer, color: Colors.white),
  //           SizedBox(width: 10),
  //           Expanded(
  //             child: Text(
  //               faq['question']!,
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       ),
  //       content: faq['answer']!,
  //       expandedTitleBackgroundColor: Colors.deepOrange,
  //       collapsedTitleBackgroundColor: Colors.blue,
  //       titlePadding: const EdgeInsets.all(10),
  //       textStyle: TextStyle(color: Colors.white),
  //     );
  //   }).toList();
  // }

  List<Widget> _buildFAQList() {
    return faqs.map((faq) {
      return GFAccordion(
          collapsedTitleBackgroundColor: Colors.blue,
          expandedTitleBackgroundColor: Colors.red,
          textStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
          contentBorder:
              Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
          titleBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
          contentBorderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r)),
          title: faq['question']!,
          content: faq['answer']!,
          collapsedIcon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          expandedIcon: const Icon(
            Icons.minimize,
            color: Colors.white,
          ));
    }).toList();
  }
}
