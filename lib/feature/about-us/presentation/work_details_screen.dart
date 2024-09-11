import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class WorkDetailsScreen extends StatelessWidget {
  const WorkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How We Work',
          style: TextStyle(fontSize: 25.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            Text(
              'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis ',
              style: TextStyle(
                fontSize: 17.sp,
              ),
              textAlign: TextAlign.center,
            ),
            verticalGap(10.h),
            SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg?auto=compress&cs=tinysrgb&w=600",
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 60.sp,
                        ),
                      ),
                    ),
                  ],
                )),
            verticalGap(10.h),
            Text(
              'Get our medical service and ensure your physical health',
              style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.",
              style: TextStyle(fontSize: 17.sp),
              textAlign: TextAlign.center,
            ),
            verticalGap(10.h),
            GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue,
                expandedTitleBackgroundColor: Colors.red,
                textStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
                contentBorder:
                    Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
                titleBorderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                contentBorderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)),
                title: 'Who are our patients?',
                content:
                    'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus delicatissimi no. Eu cum dico melius. Cum impetus scribentur ad.',
                collapsedIcon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                expandedIcon: const Icon(
                  Icons.minimize,
                  color: Colors.white,
                )),
            GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue,
                expandedTitleBackgroundColor: Colors.red,
                textStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
                contentBorder:
                    Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
                titleBorderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                contentBorderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)),
                title: 'When is doctor available?',
                content:
                    'Ut alterum dissentiunt eam, nobis audire verterem ut vel. Vidisse persius mea no. Melius imperdiet his at. Ex has zril convenire, cu eos eros dolor, omittam adversarium suscipiantur mea ea.',
                collapsedIcon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                expandedIcon: const Icon(
                  Icons.minimize,
                  color: Colors.white,
                )),
            GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue,
                expandedTitleBackgroundColor: Colors.red,
                textStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
                contentBorder:
                    Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
                titleBorderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                contentBorderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)),
                title: 'How do I register in this system?',
                content:
                    'Est odio quaeque legimus ad. Eu sumo diam fabellas vim. In mea graece suscipiantur, omnis dolorem expetenda in usu, suas oportere theophrastus ei pro. Amet facer eripuit cu his, mea at quis maluisset, ferri perfecto constituam at mea. Nostro eleifend in pri.',
                collapsedIcon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                expandedIcon: const Icon(
                  Icons.minimize,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
