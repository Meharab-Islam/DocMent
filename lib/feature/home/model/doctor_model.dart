class DoctorModel {
  final int id;
  final String name;
  final String image;
  final String slug;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String designations;
  final String departmentName;
  final String locationName;

  DoctorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.designations,
    required this.departmentName,
    required this.locationName,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      slug: json['slug'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      designations: json['translations'][0]['designations'],
      departmentName: json['department']['translations'][0]['name'],
      locationName: json['location']['translations'][0]['name'],
    );
  }
}
