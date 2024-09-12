import 'package:docment/core/const_design.dart';
import 'package:docment/feature/home/presentation/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Found Doctors'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return Bounceable(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DoctorDetailsScreen();
                  }
                ));
              },
              child: Container(
                height: 180.h,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        fit: BoxFit.cover)),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(162, 0, 0, 0),
                        Color.fromARGB(237, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          'Dr. Jhon Doe',
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.sp),
                        ),
                        Text(
                          'Ophthalmology',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.redAccent, size: 22.sp),
                            Text(
                              'NewYork',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.sp),
                            ),
                          ],
                        ),
                        verticalGap(5.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
