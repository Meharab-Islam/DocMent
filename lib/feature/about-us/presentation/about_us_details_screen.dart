import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:docment/feature/about-us/widget/about_details_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/text_style.dart';

class AboutUsDetailsScreen extends StatelessWidget {
  const AboutUsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleText(text: "About Us"),
        backgroundColor: Colors.deepOrange,
        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            const AboutDetailsCard(
              image:
                  "https://demo.websolutionus.com/docment/uploads/website-images/about-2022-02-26-07-43-41-1892.jpg",
              title: 'Special Doctors Are Dedicated to Our Patients',
              description:
                  'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus delicatissimi no. Eu cum dico melius. Cum impetus scribentur ad. Ut alterum dissentiunt eam, nobis audire verterem ut vel. Vidisse persius mea no. Melius imperdiet his at. Ex has zril convenire, cu eos eros dolor, omittam adversarium suscipiantur mea ea. Est odio quaeque legimus ad. Eu sumo diam fabellas vim. In mea graece suscipiantur, omnis dolorem expetenda in usu, suas oportere theophrastus ei pro. Amet facer eripuit cu his, mea at quis maluisset, ferri perfecto constituam at mea. Nostro eleifend in pri.',
            ),
            const Divider(),
            verticalGap(20.h),
            const AboutDetailsCard(
              image:
                  "https://demo.websolutionus.com/docment/uploads/website-images/mission-2021-10-26-12-04-31-5341.jpg",
              title: 'Our Mission',
              description:
                  'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus delicatissimi no. Eu cum dico melius. Cum impetus scribentur ad. Ut alterum dissentiunt eam, nobis audire verterem ut vel. Vidisse persius mea no. Melius imperdiet his at. Ex has zril convenire, cu eos eros dolor, omittam adversarium suscipiantur mea ea. Est odio quaeque legimus ad. Eu sumo diam fabellas vim. In mea graece suscipiantur, omnis dolorem expetenda in usu, suas oportere theophrastus ei pro. Amet facer eripuit cu his, mea at quis maluisset, ferri perfecto constituam at mea. Nostro eleifend in pri.',
            ),
            const Divider(),
            verticalGap(20.h),
            const AboutDetailsCard(
              image:
                  "https://demo.websolutionus.com/docment/uploads/website-images/mission-2021-10-26-12-04-44-8431.jpg",
              title: 'Our Vision',
              description:
                  'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus delicatissimi no. Eu cum dico melius. Cum impetus scribentur ad. Ut alterum dissentiunt eam, nobis audire verterem ut vel. Vidisse persius mea no. Melius imperdiet his at. Ex has zril convenire, cu eos eros dolor, omittam adversarium suscipiantur mea ea. Est odio quaeque legimus ad. Eu sumo diam fabellas vim. In mea graece suscipiantur, omnis dolorem expetenda in usu, suas oportere theophrastus ei pro. Amet facer eripuit cu his, mea at quis maluisset, ferri perfecto constituam at mea. Nostro eleifend in pri.',
            ),
          ],
        ),
      ),
    );
  }
}
