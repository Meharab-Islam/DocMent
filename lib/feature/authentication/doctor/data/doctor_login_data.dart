import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/authentication/doctor/model/doctor_login_model.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_main_screen.dart';
import 'package:docment/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DoctorLoginData {
  final GetStorage storage = GetStorage();
  final String apiUrl = doctor_loin_url;

  Future<bool> loginDcotor(
   DoctorLoginModel user, BuildContext context,
  ) async{
    try{
      final response = await http.post(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',}, body: jsonEncode(user.toJson()));
      print(response.body);
      if(response.statusCode == 201 || response.statusCode == 200){
        // Successful login
         var responseData = jsonDecode(response.body);
        String token = responseData['token']; // Adjust to your API response

        // Save token using GetStorage
        storage.write('doctor_auth_token', token);

        print("token is " + storage.read("doctor_auth_token"));
        

        Get.offAll(() => DashboardMainScreen());


        print('User logged in successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User logged in successfully'),
          ),
        );
        return true;
      }else{
        // Handle error (e.g., show error message)
        print('Login failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body),
          ),
        );
        return false;
      }
    }catch(e){
      // Handle error (e.g., show error message)
      print('Login failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }
}
