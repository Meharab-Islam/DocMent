class DoctorAppointmentModel {
  final String status;
  final AppointmentData data;

  DoctorAppointmentModel({required this.status, required this.data});

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
    return DoctorAppointmentModel(
      status: json['status'],
      data: AppointmentData.fromJson(json['data']),
    );
  }
}

class AppointmentData {
  final int currentPage;
  final List<Appointment> appointments;
  final String firstPageUrl;
  final int total;

  AppointmentData({
    required this.currentPage,
    required this.appointments,
    required this.firstPageUrl,
    required this.total,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    var appointmentList = json['data'] as List;
    List<Appointment> appointments =
        appointmentList.map((i) => Appointment.fromJson(i)).toList();

    return AppointmentData(
      currentPage: json['current_page'],
      appointments: appointments,
      firstPageUrl: json['first_page_url'],
      total: json['total'],
    );
  }
}

class Appointment {
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
  final Schedule schedule;

  Appointment({
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
    required this.schedule,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
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
      schedule: Schedule.fromJson(json['schedule']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String image;
  final UserDetails details;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.details,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
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

class Schedule {
  final int id;
  final int dayId;
  final int doctorId;
  final String startTime;
  final String endTime;
  final int quantity;
  final int status;

  Schedule({
    required this.id,
    required this.dayId,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.quantity,
    required this.status,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      dayId: json['day_id'],
      doctorId: json['doctor_id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      quantity: json['quantity'],
      status: json['status'],
    );
  }
}
