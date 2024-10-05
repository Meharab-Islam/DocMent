// doctor_profile_model.dart
class DoctorProfileModel {
  String? status;
  DoctorData? data;

  DoctorProfileModel({this.status, this.data});

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      status: json['status'],
      data: json['data'] != null ? DoctorData.fromJson(json['data']) : null,
    );
  }
}

class DoctorData {
  int? id;
  int? departmentId;
  int? locationId;
  String? name;
  String? slug;
  String? email;
  String? phone;
  int? fee;
  String? image;
  String? facebook;
  String? twitter;
  String? linkedin;
  int? status;
  int? showHomepage;
  List<DoctorTranslation>? translations;

  DoctorData({
    this.id,
    this.departmentId,
    this.locationId,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.fee,
    this.image,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.status,
    this.showHomepage,
    this.translations,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      id: json['id'],
      departmentId: json['department_id'],
      locationId: json['location_id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'],
      fee: json['fee'],
      image: json['image'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      status: json['status'],
      showHomepage: json['show_homepage'],
      translations: json['translations'] != null
          ? (json['translations'] as List)
              .map((e) => DoctorTranslation.fromJson(e))
              .toList()
          : [],
    );
  }
}

class DoctorTranslation {
  int? id;
  int? doctorId;
  String? langCode;
  String? designations;
  String? about;
  String? address;
  String? educations;
  String? experience;
  String? qualifications;
  String? seoTitle;
  String? seoDescription;

  DoctorTranslation({
    this.id,
    this.doctorId,
    this.langCode,
    this.designations,
    this.about,
    this.address,
    this.educations,
    this.experience,
    this.qualifications,
    this.seoTitle,
    this.seoDescription,
  });

  factory DoctorTranslation.fromJson(Map<String, dynamic> json) {
    return DoctorTranslation(
      id: json['id'],
      doctorId: json['doctor_id'],
      langCode: json['lang_code'],
      designations: json['designations'],
      about: json['about'],
      address: json['address'],
      educations: json['educations'],
      experience: json['experience'],
      qualifications: json['qualifications'],
      seoTitle: json['seo_title'],
      seoDescription: json['seo_description'],
    );
  }
}
