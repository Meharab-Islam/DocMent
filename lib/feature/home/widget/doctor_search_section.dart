import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:docment/core/widget/button.dart';
import 'package:docment/core/widget/text_style.dart';
import 'package:docment/feature/global/presentation/dropdown_search_button.dart';
import 'package:docment/feature/home/controller/doctor_controller.dart';
import 'package:docment/feature/home/controller/location_data_controller.dart';
import 'package:docment/feature/home/data/department_data.dart';
import 'package:docment/feature/home/data/doctor_data.dart';
import 'package:docment/feature/home/data/location_data.dart';
import 'package:docment/feature/home/presentation/doctor_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/const_design.dart';
import '../controller/department_controller.dart';

class DoctorSearchSection extends StatelessWidget {
  const DoctorSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController _locationController = Get.put(LocationController(locationService: LocationService()));
    final DepartmentController _departmentController = Get.put(DepartmentController(departmentService: DepartmentService()));
    final DoctorController _doctorController = Get.put(DoctorController( DoctorService()));

    List image = [
      'https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1,',
      "https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/2324837/pexels-photo-2324837.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ];
    return SizedBox(
      height: 330.h,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: image[index],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              height: 330.h,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              aspectRatio: 2,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 4),
              pauseAutoPlayOnTouch: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(134, 0, 0, 0),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 330.h,
            width: double.infinity,
            child: Column(
              children: [
                const Spacer(),
                titleText(
                  text: "Search The Best Doctors",
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
                bodyText(
                  text:
                      "Find out department and location based doctors near your area",
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
                verticalGap(20.h),
                Obx(() {
                  if (_locationController.isLoading.value == true) {
                    return const CircularProgressIndicator();
                  } else {
                    return DropDownField(
                      title: 'Select Location',
                      items:  _locationController.location.map((department) {
                return department.translations[0].name; // Assuming `name` is the display value
              }).toList(),
                      onItemSelected: (value) {
                        print(value);
                      },
                    );
                  }
                }),
                verticalGap(10.h),
                Obx(() {
                  if (_departmentController.isLoading.value == true) {
                    return const CircularProgressIndicator();
                  } else {
                    return DropDownField(
                      title: 'Select Departments',
                      items: _departmentController.departments.map((department) {
                return department.translations[0].name; // Assuming `name` is the display value
              }).toList(),
                      onItemSelected: (value) {
                        print(value);
                      },
                    );
                  }
                }),
       
               
                verticalGap(10.h),
               Obx(() {
  if (_doctorController.isLoading.value) {
    return const CircularProgressIndicator();
  } else {
    return DropDownField(
      title: 'Select Doctor',
      items: _doctorController.doctorList.map((doctor) => doctor.name).toList(),
      onItemSelected: (value) {
        print(value);  // You can get selected doctor details here.
      },
    );
  }
}),
                verticalGap(10.h),
                SubmitButton(
                    height: 33.h,
                    width: MediaQuery.of(context).size.width / 2,
                    text: "Search",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorListScreen(),
                        ),
                      );
                    }),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
