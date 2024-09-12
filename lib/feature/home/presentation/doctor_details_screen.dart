import 'package:docment/core/const_design.dart';
import 'package:docment/feature/home/widget/bottom_sheet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 180.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalGap(13.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.blue,
                          ),
                          child: const Icon(FontAwesomeIcons.facebook,
                              color: Colors.white),
                        ),
                        horizontalGap(5.w),
                        Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.blue,
                          ),
                          child: const Icon(FontAwesomeIcons.twitter,
                              color: Colors.white),
                        ),
                        horizontalGap(5.w),
                        Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.blue,
                          ),
                          child: const Icon(FontAwesomeIcons.linkedin,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    verticalGap(10.h),
                    Text(
                      'Fee: \$65',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                    ),
                    verticalGap(10.h),
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
                    verticalGap(10.h),
                    Bounceable(
                        onTap: () {
                          showCustomBottomSheet(context);
                        },
                        child: Container(
                          height: 33.h,
                          // width: MediaQuery.of(context).size.width / 2,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Center(
                            child: Text(
                              "Appointment",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            verticalGap(10.h),
            Text(
              'Dr. John Doe',
              style: TextStyle(
                fontSize: 29.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // verticalGap(2.h),
            // Text(
            //   'Ophthalmology',
            //   style: TextStyle(
            //     fontSize: 17.sp,
            //     fontWeight: FontWeight.w400,
            //     color: Colors.redAccent,
            //   ),
            // ),
            // verticalGap(4.h),
            Row(
              children: [
                Icon(FontAwesomeIcons.graduationCap,
                    color: Colors.redAccent, size: 20.sp),
                horizontalGap(10.w),
                Text(
                  'Ophthalmology (MBBS, FCPS, FRCS)',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
                ),
              ],
            ),

            verticalGap(10.h),
            Text(
              'Lorem ipsum dolor sit amet, ut per sale oblique, ei ipsum everti noluisse pri, cum cetero invidunt cu. Mel ridens impetus dolorem ad. In ius augue voluptatum definitionem, ei sit scripta quaeque. Quo in feugait delicata, erant scriptorem quo in, sed diam aliquam feugait id. Eos ut delenit propriae constituam, simul verear commune ei nec. Ex iuvaret alienum est, ei feugait maiestatis vel. Ornatus vituperatoribus eu duo, ius amet soluta scripserit',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),

            verticalGap(10.h),
            const Divider(),
            verticalGap(10.h),
            Text(
              'Working Hour',
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            verticalGap(7.h),
            Table(
              border: TableBorder
                  .all(), // Adds a border decoration around the table
              columnWidths: const {
                0: FlexColumnWidth(1), // Adjusts the width of the first column
                1: FlexColumnWidth(1), // Adjusts the width of the second column
              },
              defaultVerticalAlignment:
                  TableCellVerticalAlignment.middle, // Centers text vertically
              children: [
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0
                          .sp), // Increase cell padding for more height and width
                      child: Text(
                        'Week Day',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0.sp),
                      child: Text(
                        'Shedule',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0.sp),
                      child: Text(
                        '2011',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0.sp),
                      child: Text(
                        'Dart',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            verticalGap(10.h),
            const Divider(),
            verticalGap(10.h),
            Text(
              'Experience',
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Text(
              'Lorem ipsum dolor sit amet, ut per sale oblique, ei ipsum everti noluisse pri, cum cetero invidunt cu. Mel ridens impetus dolorem ad. In ius augue voluptatum definitionem, ei sit scripta quaeque. Quo in feugait delicata, erant scriptorem quo in, sed diam aliquam feugait id. Eos ut delenit propriae constituam, simul verear commune ei nec. Ex iuvaret alienum est, ei feugait maiestatis vel. Ornatus vituperatoribus eu duo, ius amet soluta scripserit',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),

            verticalGap(10.h),
            const Divider(),
            verticalGap(10.h),
            Text(
              'Qualifications',
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Text(
              'Lorem ipsum dolor sit amet, ut per sale oblique, ei ipsum everti noluisse pri, cum cetero invidunt cu. Mel ridens impetus dolorem ad. In ius augue voluptatum definitionem, ei sit scripta quaeque. Quo in feugait delicata, erant scriptorem quo in, sed diam aliquam feugait id. Eos ut delenit propriae constituam, simul verear commune ei nec. Ex iuvaret alienum est, ei feugait maiestatis vel. Ornatus vituperatoribus eu duo, ius amet soluta scripserit',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            verticalGap(10.h),
          ],
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible:
          false, // Prevents the sheet from closing when tapping outside
      enableDrag: false, // Prevents closing the sheet when dragging
      backgroundColor: Colors
          .transparent, // Transparent background to better visualize the effect
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }
}
