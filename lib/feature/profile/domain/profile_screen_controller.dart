

import 'package:docment/feature/profile/data/profile_data_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileModel profile = ProfileModel(
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+123456789',
    guardianName: 'Jane Doe',
    guardianPhone: '+987654321',
    age: '30',
    occupation: 'Software Engineer',
    gender: 'Male',
    address: '123 Main St, Cityville',
    country: 'Countryland',
    city: 'Cityville',
    profilePicture: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
    dateOfBirth: '1990-01-01',
    weight: '75kg',
    height: '180cm',
    healthInsuranceNumber: 'HIN12345',
    healthCardNumber: 'HCN67890',
    healthCardProvider: 'HealthPlus',
    bloodGroup: 'O+',
    disabilities: 'None',
  );
}
