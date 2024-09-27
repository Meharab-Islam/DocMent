class PatientLoginModel {
  String email;
  String password;

  PatientLoginModel({
    required this.email,
    required this.password,
  });

  // convert JSON to Object
  factory PatientLoginModel.fromJson(Map<String, dynamic> json) {
    return PatientLoginModel(
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
