import 'dart:io';

import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var guardianName = ''.obs;
  var guardianPhone = ''.obs;
  var age = ''.obs;
  var occupation = ''.obs;
  var gender = ''.obs;
  var address = ''.obs;
  var city = ''.obs;
  var country = ''.obs;
  var dateOfBirth = ''.obs;
  var weight = ''.obs;
  var height = ''.obs;
  var healthInsuranceNumber = ''.obs;
  var healthCardNumber = ''.obs;
  var healthCardProvider = ''.obs;
  var bloodGroup = ''.obs;
  var disabilities = ''.obs;
  var profileImage = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
    }
  }
}

class EditProfileScreen extends StatelessWidget {
  final EditProfileScreenController controller =
      Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          children: [
            verticalGap(20.h),
            GestureDetector(
              onTap: () {
                controller.pickImage();
              },
              child: Obx(() => CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.profileImage.value.isNotEmpty
                        ? FileImage(File(controller.profileImage.value))
                        : NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg"), // Default image
                    child: controller.profileImage.value.isEmpty
                        ? Icon(Icons.camera_alt, size: 30.sp)
                        : null,
                  )),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField('Name', controller.name.value),
                    verticalGap(10.h),
                    _buildTextField('Email', controller.email.value),
                    verticalGap(10.h),
                    _buildPhoneField(),
                    verticalGap(10.h),
                    _buildTextField(
                        'Guardian Name', controller.guardianName.value),
                    verticalGap(10.h),
                    _buildGuardianPhoneField(),
                    verticalGap(10.h),
                    _buildTextField('Age', controller.age.value),
                    verticalGap(10.h),
                    _buildTextField('Occupation', controller.occupation.value),
                    verticalGap(10.h),
                    _buildGenderDropdown(),
                    verticalGap(10.h),
                    _buildTextField('Address', controller.address.value),
                    verticalGap(10.h),
                    _buildTextField('City', controller.city.value),
                    verticalGap(10.h),
                    _buildTextField('Country', controller.country.value),
                    verticalGap(10.h),
                    _buildDatePicker(context),
                    verticalGap(10.h),
                    _buildTextField('Weight', controller.weight.value),
                    verticalGap(10.h),
                    _buildTextField('Height', controller.height.value),
                    verticalGap(10.h),
                    _buildTextField('Health Insurance Number',
                        controller.healthInsuranceNumber.value),
                    verticalGap(10.h),
                    _buildTextField('Health Card Number',
                        controller.healthCardNumber.value),
                    verticalGap(10.h),
                    _buildTextField('Health Card Provider',
                        controller.healthCardProvider.value),
                    verticalGap(10.h),
                    _buildTextField('Blood Group', controller.bloodGroup.value),
                    verticalGap(10.h),
                    _buildTextField(
                        'Disabilities', controller.disabilities.value),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar('Success', 'Profile updated successfully');
                      },
                      child: Text(
                        'Save Profile',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    verticalGap(20.h),
                  ],
                ),
              ),
            ),
            verticalGap(20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (newValue) {
        // Update the corresponding value in the controller
      },
      controller: TextEditingController(
          text: initialValue.isNotEmpty ? initialValue : ''),
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (phone) {
        controller.phone.value = phone.completeNumber;
      },
      initialValue:
          controller.phone.value.isNotEmpty ? controller.phone.value : null,
    );
  }

  Widget _buildGuardianPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Guardian Phone',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (phone) {
        controller.guardianPhone.value = phone.completeNumber;
      },
      initialValue: controller.guardianPhone.value.isNotEmpty
          ? controller.guardianPhone.value
          : null,
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      items: ['Male', 'Female', 'Other'].map((gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: (value) {
        controller.gender.value = value ?? '';
      },
      value:
          controller.gender.value.isNotEmpty ? controller.gender.value : null,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Date of Birth',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      controller: TextEditingController(
          text: controller.dateOfBirth.value.isNotEmpty
              ? controller.dateOfBirth.value
              : ''),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          controller.dateOfBirth.value =
              '${pickedDate.toLocal()}'.split(' ')[0];
        }
      },
    );
  }
}
