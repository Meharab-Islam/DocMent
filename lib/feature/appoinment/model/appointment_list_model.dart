// models/appointment_model.dart

class AppointmentListModel {
  int id;
  bool alreadyTreated;
  String date;
  double appointmentFee;
  String payableCurrency;
  int paymentStatus;
  String paymentTransactionId;
  String paymentMethod;
  String? bloodPressure;
  String? pulseRate;
  String? temperature;
  String? problemDescription;
  String? habits;
  int status;
  Doctor doctor;

  AppointmentListModel({
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
    required this.doctor,
  });

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) {
    return AppointmentListModel(
      id: json['id'],
      alreadyTreated: json['already_treated'] == 1,
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
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Doctor {
  int id;
  String name;
  String email;
  String image;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
