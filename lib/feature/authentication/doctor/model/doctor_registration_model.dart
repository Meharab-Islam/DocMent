class DoctorRegistrationModel {
  String? name;
  String? designations;
  String? email;
  String? phone;
  String? departmentId;
  String? locationId;
  String? password;
  String? passwordConfirmation;

  DoctorRegistrationModel({
    this.name,
    this.designations,
    this.email,
    this.phone,
    this.departmentId,
    this.locationId,
    this.password,
    this.passwordConfirmation,
  });

  // Convert UserModel to JSON to send to API
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'designations': designations,
      'email': email,
      'phone': phone,
      'department_id': departmentId,
      'location_id': locationId,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
