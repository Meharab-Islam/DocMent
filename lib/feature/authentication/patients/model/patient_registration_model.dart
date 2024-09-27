class PatientRegistrationModel {
  String name;
  String email;
  String password;
  String passwordConfirmation;

  PatientRegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  // Convert JSON to  object
  factory PatientRegistrationModel.fromJson(Map<String, dynamic> json) {
    return PatientRegistrationModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
