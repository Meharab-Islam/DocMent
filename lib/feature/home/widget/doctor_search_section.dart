import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:docment/core/widget/text_style.dart';
import 'package:docment/feature/home/presentation/doctor_list_screen.dart';
import 'package:docment/feature/home/widget/drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const_design.dart';

class DoctorSearchSection extends StatelessWidget {
  const DoctorSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                const DropDownField(
                  title: 'Select Location',
                  items: ["Boston", "Chicago", "Los Angeles", "New York"],
                ),
                verticalGap(10.h),
                const DropDownField(
                  title: 'Select Department',
                  items: [
                    "Cardiology",
                    "Neurology",
                    "Opthalmology",
                    "Pediatric",
                    "Radiology",
                    "Urology",
                  ],
                ),
                verticalGap(10.h),
                const DropDownField(
                  title: 'Select Doctor',
                  items: [
                    "Dr. John Doe",
                    "Dr. Jane Smith",
                    "Dr. Michael Johnson",
                    "Dr. Sarah Lee",
                    "Dr. Olivia Chen",
                    "Dr. David Kim",
                  ],
                ),
                verticalGap(10.h),
                Bounceable(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorListScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 33.h,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 104, 104),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
