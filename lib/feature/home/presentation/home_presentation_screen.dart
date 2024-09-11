import 'package:docment/core/const_design.dart';
import 'package:docment/feature/home/widget/doctor_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePresentationScreen extends StatelessWidget {
  const HomePresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List color = [
      Colors.blue,
      Colors.red,
      Colors.blue,
    ];

    List data = [
      {
        "icon": Icons.favorite,
        "title": "Operation Theater",
        "description":
            "We have modeern and well furnished operation theatre in the city",
      },
      {
        "icon": Icons.fire_truck,
        "title": "Emergency Services",
        "description":
            "If you need any kind of emergency services, we are always available",
      },
      {
        "icon": Icons.person,
        "title": "Qualified Doctors",
        "description":
            "We have the best qualified doctors to serve our valuable patients",
      },
    ];

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const SliverToBoxAdapter(child: DoctorSearchSection()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
        ];
      },
      body: SizedBox(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  color: color[index].withOpacity(0.90),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 200.h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        data[index]['icon'],
                        color: Colors.white,
                        size: 50.sp,
                      ),
                      Text(
                        data[index]['title'].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      verticalGap(10.sp),
                      Text(
                        data[index]['description'].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
