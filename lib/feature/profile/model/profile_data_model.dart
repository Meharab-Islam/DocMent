class PatientModel {
  int id;
  String patientId;
  String name;
  String email;
  String? image;
  int readyForAppointment;
  PatientDetails details;

  PatientModel({
    required this.id,
    required this.patientId,
    required this.name,
    required this.email,
    this.image,
    required this.readyForAppointment,
    required this.details,
  });

  // Factory method to create a Patient instance from JSON
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      patientId: json['patient_id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      readyForAppointment: json['ready_for_appointment'],
      details: PatientDetails.fromJson(json['details']),
    );
  }
}

class PatientDetails {
  int id;
  String phone;
  String address;
  String city;
  String country;
  String guardianName;
  String guardianPhone;
  String? healthInsuranceNumber;
  String? healthCardNumber;
  String? healthCardProvider;
  String occupation;
  String age;
  String dateOfBirth;
  String gender;
  String weight;
  String? height;
  String? bloodGroup;
  String? disabilities;

  PatientDetails({
    required this.id,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    required this.guardianName,
    required this.guardianPhone,
    this.healthInsuranceNumber,
    this.healthCardNumber,
    this.healthCardProvider,
    required this.occupation,
    required this.age,
    required this.dateOfBirth,
    required this.gender,
    required this.weight,
    this.height,
    this.bloodGroup,
    this.disabilities,
  });

  // Factory method to create a PatientDetails instance from JSON
  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
      id: json['id'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      guardianName: json['guardian_name'],
      guardianPhone: json['guardian_phone'],
      healthInsuranceNumber: json['health_insurance_number'],
      healthCardNumber: json['health_card_number'],
      healthCardProvider: json['health_card_provider'],
      occupation: json['occupation'],
      age: json['age'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      weight: json['weight'],
      height: json['height'],
      bloodGroup: json['blood_group'],
      disabilities: json['disabilities'],
    );
  }
}
