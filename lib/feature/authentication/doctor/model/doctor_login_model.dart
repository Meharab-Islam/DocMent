class DoctorLoginModel {
  String email;
  String password;

  DoctorLoginModel({
    required this.email,
    required this.password,
  });

  // convert JSON to Object
  factory DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    return DoctorLoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  // convert Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
