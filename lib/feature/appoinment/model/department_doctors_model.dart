// department_doctors_model.dart
class DepartmentDoctorsModel {
  final int id;
  final int departmentId;
  final int locationId;
  final String name;
  final String email;
  final String phone;
  final double fee;
  final String image;
  final String facebook;
  final String twitter;
  final String linkedin;
  final int status;
  final int showHomepage;

  DepartmentDoctorsModel({
    required this.id,
    required this.departmentId,
    required this.locationId,
    required this.name,
    required this.email,
    required this.phone,
    required this.fee,
    required this.image,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.status,
    required this.showHomepage,
  });

  factory DepartmentDoctorsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentDoctorsModel(
      id: json['id'],
      departmentId: json['department_id'],
      locationId: json['location_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      fee: json['fee'].toDouble(),
      image: json['image'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      status: json['status'],
      showHomepage: json['show_homepage'],
    );
  }
}










//  Obx(() => Bounceable(
//                   onTap: () {
//                     _selectDate(context);
//                   },
//                   child: Container(
//                     height: 40.h,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 187, 187, 187)),
//                       color: Colors.white,
//                     ),
//                     child: Center(
//                       child: Row(
//                         children: [
//                           horizontalGap(15.w),
//                           Text(
//                             controller.selectedDate.value == DateTime.now()
//                                 ? 'Select Date'
//                                 : _dateFormat
//                                     .format(controller.selectedDate.value),
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 color: const Color.fromARGB(255, 63, 63, 63)),
//                           ),
//                           const Spacer(),
//                           Icon(
//                             Icons.arrow_drop_down,
//                             color: const Color.fromARGB(255, 126, 126, 126),
//                             size: 34.sp,
//                           ),
//                           horizontalGap(15.w),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )),















  // final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime currentDate = DateTime.now();
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: currentDate,
  //     firstDate: currentDate,
  //     lastDate: DateTime(currentDate.year + 10),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: const ColorScheme.light(
  //             primary: Colors.red,
  //             onPrimary: Colors.white,
  //             onSurface: Colors.black,
  //           ),
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.red,
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );

  //   if (pickedDate != null) {
  //     controller.updateSelectedDate(pickedDate);
  //   }
  // }