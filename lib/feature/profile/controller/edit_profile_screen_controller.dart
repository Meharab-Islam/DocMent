// import 'package:docment/feature/profile/data/profile_data_model.dart';
// import 'package:get/get.dart';


// class EditProfileController extends GetxController {
//   // Rx variables for each field to handle form input
//   var name = ''.obs;
//   var email = ''..obs;
//   var phone = ''.obs;
//   var guardianName = ''.obs;
//   var guardianPhone = ''.obs;
//   var age = ''.obs;
//   var occupation = ''.obs;
//   var gender = ''.obs;
//   var address = ''.obs;
//   var country = ''.obs;
//   var city = ''.obs;
//   var dateOfBirth = ''.obs;
//   var weight = ''.obs;
//   var height = ''.obs;
//   var healthInsuranceNumber = ''.obs;
//   var healthCardNumber = ''..obs;
//   var healthCardProvider = ''.obs;
//   var bloodGroup = ''.obs;
//   var disabilities = ''.obs;

//   // Initialize controller with existing data (if any)
//   void initializeData(ProfileModel? profile) {
//     if (profile != null) {
//       name.value = profile.name ?? '';
//       email.value = profile.email ?? "";
//       phone.value = profile.phone ?? '';
//       guardianName.value = profile.guardianName ?? '';
//       guardianPhone.value = profile.guardianPhone ?? '';
//       age.value = profile.age?.toString() ?? '';
//       occupation.value = profile.occupation ?? '';
//       gender.value = profile.gender ?? '';
//       address.value = profile.address ?? '';
//       country.value = profile.country ?? '';
//       city.value = profile.city ?? '';
//       dateOfBirth.value = profile.dateOfBirth ?? '';
//       weight.value = profile.weight?.toString() ?? '';
//       height.value = profile.height?.toString() ?? '';
//       healthInsuranceNumber.value = profile.healthInsuranceNumber ?? '';
//       healthCardNumber.value = profile.healthCardNumber ?? '';
//       healthCardProvider.value = profile.healthCardProvider ?? '';
//       bloodGroup.value = profile.bloodGroup ?? '';
//       disabilities.value = profile.disabilities ?? '';
//     }
//   }

//   // Mock save method
//   void saveProfile() {
//     // Logic for saving the profile
//     print("Profile updated!");
//   }
// }
