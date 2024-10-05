// appointment_details_model.dart
class AppointmentDetailsModel {
  final int id;
  final int alreadyTreated;
  final String date;
  final double appointmentFee;
  final String payableCurrency;
  final int paymentStatus;
  final String paymentTransactionId;
  final String paymentMethod;
  final String? bloodPressure;
  final String? pulseRate;
  final String? temperature;
  final String? problemDescription;
  final String? habits;
  final int status;
  final User user;
  final Doctor doctor;

  AppointmentDetailsModel({
    required this.id,
    required this.alreadyTreated,
    required this.date,
    required this.appointmentFee,
    required this.payableCurrency,
    required this.paymentStatus,
    required this.paymentTransactionId,
    required this.paymentMethod,
    this.bloodPressure,
    this.pulseRate,
    this.temperature,
    this.problemDescription,
    this.habits,
    required this.status,
    required this.user,
    required this.doctor,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDetailsModel(
      id: json['id'],
      alreadyTreated: json['already_treated'],
      date: json['date'],
      appointmentFee: json['appointment_fee'].toDouble(),
      payableCurrency: json['payable_currency'],
      paymentStatus: json['payment_status'],
      paymentTransactionId: json['payment_transaction_id'],
      paymentMethod: json['payment_method'],
      bloodPressure: json['blood_pressure'],
      pulseRate: json['pulse_rate'],
      temperature: json['temperature'],
      problemDescription: json['problem_description'],
      habits: json['habits'],
      status: json['status'],
      user: User.fromJson(json['user']),
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class User {
  final int id;
  final String patientId;
  final String name;
  final String email;
  final String? image;
  final int readyForAppointment;
  final UserDetails details;

  User({
    required this.id,
    required this.patientId,
    required this.name,
    required this.email,
    this.image,
    required this.readyForAppointment,
    required this.details,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      patientId: json['patient_id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      readyForAppointment: json['ready_for_appointment'],
      details: UserDetails.fromJson(json['details']),
    );
  }
}

class UserDetails {
  final int id;
  final String phone;
  final String address;
  final String city;
  final String country;
  final String guardianName;
  final String guardianPhone;
  final String? healthInsuranceNumber;
  final String? healthCardNumber;
  final String? healthCardProvider;
  final String occupation;
  final String age;
  final String dateOfBirth;
  final String gender;
  final String weight;
  final String? height;
  final String? bloodGroup;
  final String? disabilities;

  UserDetails({
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

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
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

class Doctor {
  final int id;
  final int departmentId;
  final int locationId;
  final String name;
  final String slug;
  final String email;
  final String phone;
  final double fee;
  final String image;
  final String facebook;
  final String twitter;
  final String linkedin;
  final int status;
  final int showHomepage;

  Doctor({
    required this.id,
    required this.departmentId,
    required this.locationId,
    required this.name,
    required this.slug,
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

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      departmentId: json['department_id'],
      locationId: json['location_id'],
      name: json['name'],
      slug: json['slug'],
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
