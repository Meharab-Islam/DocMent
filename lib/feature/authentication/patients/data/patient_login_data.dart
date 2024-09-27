import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/authentication/patients/model/patient_login_model.dart';
import 'package:docment/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PatientLoginData {
  final GetStorage storage = GetStorage();
  final String apiUrl = patient_login_url;

  Future<bool> loginPatient(
    PatientLoginModel user, BuildContext context,
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
        storage.write('auth_token', token);
        

        Get.offAll(() => HomePage());


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
