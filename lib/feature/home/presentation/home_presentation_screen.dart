import 'package:docment/core/const_design.dart';
import 'package:docment/feature/home/widget/doctor_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            "We have modern and well-furnished operation theatres in the city.",
      },
      {
        "icon": Icons.fire_truck,
        "title": "Emergency Services",
        "description":
            "If you need any kind of emergency services, we are always available.",
      },
      {
        "icon": Icons.person,
        "title": "Qualified Doctors",
        "description":
            "We have the best-qualified doctors to serve our valuable patients.",
      },
    ];

    List testimonials = [
      {
        "name": "John Doe",
        "review":
            "The service was amazing! The doctors were very professional and the staff was very helpful.",
        "image":
            "https://images.pexels.com/photos/1139743/pexels-photo-1139743.jpeg?auto=compress&cs=tinysrgb&w=600",
        "designation": "CEO of XYZ Company",
      },
      {
        "name": "Jane Smith",
        "review":
            "I had a wonderful experience with the emergency services. The team responded quickly.",
        "image":
            "https://images.pexels.com/photos/432722/pexels-photo-432722.jpeg?auto=compress&cs=tinysrgb&w=600",
        "designation": "Manager of ABC Company",
      },
      {
        "name": "Robert Wilson",
        "review":
            "Highly qualified doctors and well-maintained facilities. I would recommend them to anyone.",
        "image":
            "https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&w=600",
        "designation": "Doctor",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
            // Testimonial Carousel Section
            verticalGap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Our",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  horizontalGap(5.w),
                  Text(
                    "Patients",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Text(
              "Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(221, 43, 43, 43),
              ),
              textAlign: TextAlign.center,
            ),
            verticalGap(10.h),
            CarouselSlider.builder(
              itemCount: testimonials.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconData(
                          0xf0a9,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: Colors.redAccent,
                      ),
                      Text(
                        testimonials[index]['review'].toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                      verticalGap(10.sp),
                      Row(children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(
                              testimonials[index]['image'].toString()),
                        ),
                        horizontalGap(10.sp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testimonials[index]['name'].toString(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              testimonials[index]['designation'].toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        )
                      ])
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                // height: 10.h,
                viewportFraction: 0.85,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
