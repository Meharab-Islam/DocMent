class DepartmentDoctorsModel {
  final int id;
  final int departmentId;
  final int locationId;
  final String name;
  final String slug;
  final String email;
  final String phone;
  final double fee; // Changed to double to accommodate for decimal values
  final String image;
  final String facebook;
  final String twitter;
  final String linkedin;
  final int status;
  final int showHomepage;

  DepartmentDoctorsModel({
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

  factory DepartmentDoctorsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentDoctorsModel(
      id: json['id'],
      departmentId: json['department_id'],
      locationId: json['location_id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'],
      fee: json['fee'].toDouble(), // Convert to double
      image: json['image'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      status: json['status'],
      showHomepage: json['show_homepage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department_id': departmentId,
      'location_id': locationId,
      'name': name,
      'slug': slug,
      'email': email,
      'phone': phone,
      'fee': fee,
      'image': image,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'status': status,
      'show_homepage': showHomepage,
    };
  }
}
